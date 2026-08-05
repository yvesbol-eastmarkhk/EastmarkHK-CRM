import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../l10n/gen/app_localizations.dart';
import '../einvoice_connector.dart';

const _imageTypes = XTypeGroup(
  label: 'Images',
  extensions: ['png', 'jpg', 'jpeg', 'webp', 'heic'],
);

/// Choisit une image pour une ligne libre — enregistre dans `line_photos/`.
Future<String?> pickLinePhotoFromDevice(BuildContext context) async {
  final mobile = !kIsWeb && (Platform.isIOS || Platform.isAndroid);
  late final Uint8List bytes;
  if (mobile) {
    final l10n = AppLocalizations.of(context);
    final choice = await showModalBottomSheet<String>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: Text(l10n.eiTakePhoto),
              onTap: () => Navigator.pop(ctx, 'camera'),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: Text(l10n.eiChooseLibrary),
              onTap: () => Navigator.pop(ctx, 'gallery'),
            ),
            ListTile(
              leading: const Icon(Icons.folder_open_outlined),
              title: Text(l10n.eiBrowseFiles),
              onTap: () => Navigator.pop(ctx, 'files'),
            ),
          ],
        ),
      ),
    );
    final picker = ImagePicker();
    switch (choice) {
      case 'camera':
        final x = await picker.pickImage(
          source: ImageSource.camera,
          imageQuality: 85,
          maxWidth: 2000,
        );
        if (x == null) return null;
        bytes = await x.readAsBytes();
      case 'gallery':
        final x = await picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 85,
          maxWidth: 2000,
        );
        if (x == null) return null;
        bytes = await x.readAsBytes();
      case 'files':
        final files = await openFiles(acceptedTypeGroups: const [_imageTypes]);
        if (files.isEmpty) return null;
        bytes = await files.first.readAsBytes();
      default:
        return null;
    }
  } else {
    final file = await openFile(acceptedTypeGroups: const [_imageTypes]);
    if (file == null) return null;
    bytes = await file.readAsBytes();
  }

  if (bytes.isEmpty) return null;
  final stored =
      await EInvoiceConnector.instance.saveLinePhotoBytes(bytes);
  return stored.isEmpty ? null : stored;
}

/// Sélectionne quelle photo catalogue / ligne apparaît sur le PDF.
///
/// Retourne :
/// - chemin stocké choisi
/// - `''` = sans photo
/// - `null` = annulé
Future<String?> showEiLinePhotoPicker(
  BuildContext context, {
  required List<String> photoPaths,
  String? selectedPath,
  bool allowNone = true,
  bool allowChooseNewFile = false,
}) async {
  final resolved = await EInvoiceConnector.instance.resolvePhotoPaths(photoPaths);
  final existing = <({String stored, String local})>[];
  for (final stored in photoPaths) {
    final local = resolved[stored];
    if (local != null && local.isNotEmpty && File(local).existsSync()) {
      existing.add((stored: stored, local: local));
    }
  }

  if (existing.isEmpty && allowChooseNewFile) {
    if (!context.mounted) return null;
    return showDialog<String>(
      context: context,
      builder: (ctx) {
        final l10n = AppLocalizations.of(ctx);
        return AlertDialog(
          title: Text(l10n.invChooseLinePhotoTitle),
          actions: [
            TextButton.icon(
              onPressed: () async {
                final path = await pickLinePhotoFromDevice(ctx);
                if (path != null && ctx.mounted) Navigator.pop(ctx, path);
              },
              icon: const Icon(Icons.add_photo_alternate_outlined),
              label: Text(l10n.invAddPhotoTooltip),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(l10n.commonCancel),
            ),
          ],
        );
      },
    );
  }

  if (existing.isEmpty) return '';
  if (existing.length == 1 && !allowNone && !allowChooseNewFile) {
    return existing.first.stored;
  }

  if (!context.mounted) return null;
  return showDialog<String>(
    context: context,
    builder: (ctx) {
      final l10n = AppLocalizations.of(ctx);
      const teal = Color(0xFF2BA89A);
      return AlertDialog(
        title: Text(l10n.invChooseLinePhotoTitle),
        content: SizedBox(
          width: 360,
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (final item in existing)
                _PhotoChoice(
                  localPath: item.local,
                  selected: item.stored == selectedPath,
                  accent: teal,
                  onTap: () => Navigator.pop(ctx, item.stored),
                ),
              if (allowNone)
                _NoneChoice(
                  selected: (selectedPath ?? '').isEmpty,
                  accent: teal,
                  onTap: () => Navigator.pop(ctx, ''),
                ),
            ],
          ),
        ),
        actions: [
          if (allowChooseNewFile)
            TextButton.icon(
              onPressed: () async {
                final path = await pickLinePhotoFromDevice(ctx);
                if (path != null && ctx.mounted) Navigator.pop(ctx, path);
              },
              icon: const Icon(Icons.folder_open_outlined),
              label: Text(l10n.invChooseNewPhoto),
            ),
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.commonCancel),
          ),
        ],
      );
    },
  );
}

class _PhotoChoice extends StatelessWidget {
  const _PhotoChoice({
    required this.localPath,
    required this.selected,
    required this.accent,
    required this.onTap,
  });

  final String localPath;
  final bool selected;
  final Color accent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 96,
        height: 96,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? accent : const Color(0xFF9AABBA),
            width: selected ? 2.5 : 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.file(
          File(localPath),
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) =>
              const Icon(Icons.broken_image_outlined),
        ),
      ),
    );
  }
}

class _NoneChoice extends StatelessWidget {
  const _NoneChoice({
    required this.selected,
    required this.accent,
    required this.onTap,
  });

  final bool selected;
  final Color accent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 96,
        height: 96,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFF0F6F5),
          border: Border.all(
            color: selected ? accent : const Color(0xFF9AABBA),
            width: selected ? 2.5 : 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            l10n.invNoPhoto,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}
