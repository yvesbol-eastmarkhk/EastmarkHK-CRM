import 'dart:io';
import 'dart:typed_data';

import 'package:desktop_drop/desktop_drop.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../l10n/gen/app_localizations.dart';
import '../einvoice_connector.dart';

/// Galerie photos produit — même UX qu'EastmarkHK e-Invoicing
/// (drag & drop, menu Ajouter, étoile photo principale).
class EiProductPhotosPicker extends StatefulWidget {
  const EiProductPhotosPicker({
    super.key,
    required this.photoPaths,
    required this.onChanged,
  });

  final List<String> photoPaths;
  final ValueChanged<List<String>> onChanged;

  @override
  State<EiProductPhotosPicker> createState() => _EiProductPhotosPickerState();
}

class _EiProductPhotosPickerState extends State<EiProductPhotosPicker> {
  static const _teal = Color(0xFF2BA89A);
  static const _border = Color(0xFF9AABBA);
  static const _bg = Color(0xFFF0F6F5);

  bool _dragging = false;
  bool _busy = false;
  final _picker = ImagePicker();
  final Map<String, String> _resolved = {};

  static const _imageTypes = XTypeGroup(
    label: 'Images',
    extensions: ['png', 'jpg', 'jpeg'],
    uniformTypeIdentifiers: [
      'public.png',
      'public.jpeg',
      'public.image',
      'public.data',
    ],
  );

  @override
  void initState() {
    super.initState();
    _resolveAll();
  }

  @override
  void didUpdateWidget(covariant EiProductPhotosPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.photoPaths != widget.photoPaths) {
      _resolveAll();
    }
  }

  Future<void> _resolveAll() async {
    for (final path in widget.photoPaths) {
      if (_resolved.containsKey(path)) continue;
      final local = await EInvoiceConnector.instance.resolvePhotoPath(path);
      if (local != null) _resolved[path] = local;
    }
    if (mounted) setState(() {});
  }

  Future<void> _addBytes(Uint8List bytes, String fileName) async {
    setState(() => _busy = true);
    try {
      final rel = await EInvoiceConnector.instance.importCatalogPhotoBytes(
        bytes,
        fileName: fileName,
      );
      if (rel.isEmpty) return;
      final local = await EInvoiceConnector.instance.resolvePhotoPath(rel);
      if (local != null) _resolved[rel] = local;
      widget.onChanged([...widget.photoPaths, rel]);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _pickFiles() async {
    final files = await openFiles(acceptedTypeGroups: const [_imageTypes]);
    for (final f in files) {
      await _addBytes(await f.readAsBytes(), f.name);
    }
  }

  Future<void> _takePhoto() async {
    final x = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
      maxWidth: 2000,
    );
    if (x == null) return;
    await _addBytes(await x.readAsBytes(), x.name);
  }

  Future<void> _pickFromGallery() async {
    final x = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
      maxWidth: 2000,
    );
    if (x == null) return;
    await _addBytes(await x.readAsBytes(), x.name);
  }

  Future<void> _handleDrop(DropDoneDetails details) async {
    for (final file in details.files) {
      final ext = file.name.contains('.')
          ? file.name.split('.').last.toLowerCase()
          : '';
      if (!['png', 'jpg', 'jpeg'].contains(ext)) continue;
      await _addBytes(await file.readAsBytes(), file.name);
    }
  }

  Future<void> _remove(int i) async {
    final path = widget.photoPaths[i];
    final next = [...widget.photoPaths]..removeAt(i);
    widget.onChanged(next);
    _resolved.remove(path);
    await EInvoiceConnector.instance.deleteCatalogPhoto(path);
  }

  void _makeMain(int i) {
    if (i == 0) return;
    final next = [...widget.photoPaths];
    final photo = next.removeAt(i);
    next.insert(0, photo);
    widget.onChanged(next);
  }

  void _previewPhoto(String path) {
    final local = _resolved[path];
    if (local == null || !File(local).existsSync()) return;
    showDialog<void>(
      context: context,
      barrierColor: Colors.black87,
      builder: (ctx) => Dialog.fullscreen(
        backgroundColor: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: InteractiveViewer(
                minScale: 0.5,
                maxScale: 8,
                child: Center(
                  child: Image.file(
                    File(local),
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  tooltip: MaterialLocalizations.of(ctx).closeButtonTooltip,
                  icon: const Icon(Icons.close, color: Colors.white, size: 28),
                  onPressed: () => Navigator.pop(ctx),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openAddMenu() async {
    final l10n = AppLocalizations.of(context);
    final choice = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: Text(l10n.eiTakePhoto),
              onTap: () => Navigator.pop(context, 'camera'),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: Text(l10n.eiChooseLibrary),
              onTap: () => Navigator.pop(context, 'gallery'),
            ),
            ListTile(
              leading: const Icon(Icons.folder_open_outlined),
              title: Text(l10n.eiBrowseFiles),
              onTap: () => Navigator.pop(context, 'files'),
            ),
          ],
        ),
      ),
    );
    switch (choice) {
      case 'camera':
        await _takePhoto();
      case 'gallery':
        await _pickFromGallery();
      case 'files':
        await _pickFiles();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropTarget(
      onDragEntered: (_) => setState(() => _dragging = true),
      onDragExited: (_) => setState(() => _dragging = false),
      onDragDone: (d) async {
        setState(() => _dragging = false);
        await _handleDrop(d);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _dragging ? _teal.withValues(alpha: 0.08) : null,
          border: Border.all(
            color: _dragging ? _teal : _border,
            width: _dragging ? 2 : 1,
          ),
        ),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (var i = 0; i < widget.photoPaths.length; i++) _photoTile(i),
            _addTile(),
          ],
        ),
      ),
    );
  }

  Widget _photoTile(int i) {
    final path = widget.photoPaths[i];
    final isMain = i == 0;
    final local = _resolved[path];
    return SizedBox(
      width: 96,
      height: 96,
      child: Stack(
        children: [
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => _previewPhoto(path),
                borderRadius: BorderRadius.circular(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: local != null && File(local).existsSync()
                      ? Image.file(File(local), fit: BoxFit.cover)
                      : Container(
                          color: _bg,
                          child: const Icon(Icons.image_outlined),
                        ),
                ),
              ),
            ),
          ),
          if (isMain)
            Positioned(
              left: 4,
              top: 4,
              child: IgnorePointer(
                child: Icon(
                  Icons.star,
                  size: 18,
                  color: Colors.amber.shade600,
                  shadows: const [Shadow(blurRadius: 4, color: Colors.black45)],
                ),
              ),
            ),
          Positioned(
            right: 2,
            top: 2,
            child: InkWell(
              onTap: () => _remove(i),
              child: const CircleAvatar(
                radius: 11,
                backgroundColor: Colors.black54,
                child: Icon(Icons.close, size: 14, color: Colors.white),
              ),
            ),
          ),
          if (!isMain)
            Positioned(
              left: 2,
              bottom: 2,
              child: InkWell(
                onTap: () => _makeMain(i),
                child: const CircleAvatar(
                  radius: 11,
                  backgroundColor: Colors.black54,
                  child: Icon(Icons.star_border, size: 14, color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _addTile() {
    final l10n = AppLocalizations.of(context);
    return InkWell(
      onTap: _busy ? null : _openAddMenu,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 96,
        height: 96,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: _bg,
          border: Border.all(color: _border),
        ),
        child: _busy
            ? const Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add_a_photo_outlined, color: _border),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      l10n.invAddPhotoTooltip,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
