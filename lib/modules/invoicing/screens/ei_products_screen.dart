import 'dart:async';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/data/countries.dart';
import '../../../core/utils/formatters.dart';
import '../../../core/utils/rich_notes.dart';
import '../../../core/widgets/dictation_field.dart';
import '../../../core/widgets/jodit_editor.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../../ui/crm_page.dart';
import '../../../widgets/section_card.dart';
import '../einvoice_connector.dart';
import '../widgets/ei_eastmark_app_bar.dart';
import '../widgets/ei_product_photos_picker.dart';

/// Catalogue Produits — même esprit que l'écran Produits d'EastmarkHK
/// e-Invoicing (grille + fiche), branché sur la base / API partagée.
class EiProductsScreen extends StatefulWidget {
  const EiProductsScreen({super.key});

  @override
  State<EiProductsScreen> createState() => _EiProductsScreenState();
}

class _EiProductsScreenState extends State<EiProductsScreen> {
  static const _gridBreakpoint = 700.0;

  List<EiProduct> _products = [];
  final Map<String, String> _resolved = {};
  String _search = '';
  bool _loading = true;
  String? _error;
  Timer? _searchDebounce;
  Timer? _refreshTimer;
  int _loadGen = 0;

  @override
  void initState() {
    super.initState();
    _load();
    _refreshTimer = Timer.periodic(const Duration(seconds: 15), (_) {
      if (mounted && !_loading && _search.trim().isEmpty) {
        _loadQuiet();
      }
    });
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _refreshTimer?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String v) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 320), () {
      _load(search: v);
    });
  }

  Future<void> _loadQuiet() async {
    final gen = ++_loadGen;
    try {
      final list = await EInvoiceConnector.instance.listProducts();
      if (!mounted || gen != _loadGen) return;
      final same = list.length == _products.length &&
          List.generate(list.length, (i) {
            final a = list[i];
            final b = _products[i];
            return a.uuid == b.uuid &&
                a.name == b.name &&
                a.ref == b.ref &&
                a.salePrice == b.salePrice &&
                a.mainPhotoPath == b.mainPhotoPath &&
                a.photoPaths.length == b.photoPaths.length;
          }).every((ok) => ok);
      if (same) return;
      // Chemins photo peuvent avoir changé — invalide le cache vignettes.
      _resolved.clear();
      setState(() => _products = list);
      await _resolveThumbs(list, gen);
    } catch (_) {}
  }

  Future<void> _load({String? search}) async {
    final q = search ?? _search;
    final gen = ++_loadGen;
    setState(() {
      _loading = true;
      _error = null;
      _search = q;
    });
    try {
      final list =
          await EInvoiceConnector.instance.listProducts(search: q);
      if (!mounted || gen != _loadGen) return;
      // Affiche la grille tout de suite — photos en arrière-plan.
      setState(() {
        _products = list;
        _loading = false;
      });
      await _resolveThumbs(list, gen);
    } catch (e) {
      if (!mounted || gen != _loadGen) return;
      setState(() {
        _error = '$e';
        _loading = false;
      });
    }
  }

  Future<void> _resolveThumbs(List<EiProduct> list, int gen) async {
    final pending = <String>[];
    for (final p in list) {
      // Toutes les photos — nécessaire pour le carrousel en liste / grille.
      for (final path in p.photoPaths) {
        if (path.isEmpty || _resolved.containsKey(path)) continue;
        pending.add(path);
      }
    }
    if (pending.isEmpty) return;
    final got = await EInvoiceConnector.instance.resolvePhotoPaths(pending);
    if (!mounted || gen != _loadGen || got.isEmpty) return;
    setState(() => _resolved.addAll(got));
  }

  Future<void> _edit([EiProduct? product]) async {
    final saved = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => _EiProductEditScreen(product: product),
      ),
    );
    if (saved == true) _load();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return CrmPage(
      title: l10n.eiProductsTitle,
      subtitle: l10n.eiProductsSubtitle,
      actions: [
        FilledButton.tonalIcon(
          onPressed: () => _edit(),
          icon: const Icon(Icons.add, size: 18),
          label: Text(l10n.eiNewProduct),
        ),
      ],
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: l10n.eiProductSearch,
                border: const OutlineInputBorder(),
                isDense: true,
              ),
              onChanged: _onSearchChanged,
            ),
          ),
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : _error != null
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Text(_error!, textAlign: TextAlign.center),
                        ),
                      )
                    : _products.isEmpty
                        ? Center(child: Text(l10n.eiNoProducts))
                        : LayoutBuilder(
                            builder: (context, constraints) {
                              if (constraints.maxWidth >= _gridBreakpoint) {
                                return GridView.builder(
                                  padding: const EdgeInsets.all(16),
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 260,
                                    mainAxisExtent: 290,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                  ),
                                  itemCount: _products.length,
                                  itemBuilder: (context, i) => _ProductCard(
                                    product: _products[i],
                                    resolved: _resolved,
                                    onTap: () => _edit(_products[i]),
                                  ),
                                );
                              }
                              return ListView.builder(
                                itemCount: _products.length,
                                itemBuilder: (context, i) {
                                  final p = _products[i];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 10,
                                    ),
                                    child: Row(
                                      children: [
                                        _PhotoThumb(
                                          paths: p.photoPaths,
                                          resolved: _resolved,
                                          size: 64,
                                          onTap: () => _edit(p),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () => _edit(p),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  p.name,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    color: Color(0xFF2BA89A),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                if (p.ref.isNotEmpty)
                                                  Text(
                                                    p.ref,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall,
                                                  ),
                                                Builder(
                                                  builder: (context) {
                                                    final desc = notesPlainText(
                                                      p.description,
                                                    );
                                                    if (desc.isEmpty) {
                                                      return const SizedBox
                                                          .shrink();
                                                    }
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        top: 2,
                                                      ),
                                                      child: Text(
                                                        desc,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall
                                                            ?.copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .onSurfaceVariant,
                                                            ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  l10n.eiPriceHt(
                                                      formatAmount(p.salePrice)),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xFF2BA89A),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.product,
    required this.resolved,
    required this.onTap,
  });

  final EiProduct product;
  final Map<String, String> resolved;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _PhotoThumb(
              paths: product.photoPaths,
              resolved: resolved,
              expand: true,
              onTap: onTap,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 36,
                    child: Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                  ),
                  if (product.ref.isNotEmpty)
                    Text(
                      product.ref,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  Builder(
                    builder: (context) {
                      final desc = notesPlainText(product.description);
                      if (desc.isEmpty) return const SizedBox.shrink();
                      return Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          desc,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                    height: 1.2,
                                  ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 4),
                  Center(
                    child: Text(
                      l10n.eiPriceHt(formatAmount(product.salePrice)),
                      style: const TextStyle(
                        color: Color(0xFF2BA89A),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PhotoThumb extends StatefulWidget {
  const _PhotoThumb({
    required this.paths,
    required this.resolved,
    this.size = 48,
    this.expand = false,
    this.onTap,
  });

  final List<String> paths;
  final Map<String, String> resolved;
  final double size;
  final bool expand;
  final VoidCallback? onTap;

  @override
  State<_PhotoThumb> createState() => _PhotoThumbState();
}

/// Carrousel produit — même comportement que e-Invoicing (drag souris,
/// flèches, autoplay). Le ListView/GridView parent ne vole plus le swipe.
class _PhotoThumbState extends State<_PhotoThumb> {
  static const _autoInterval = Duration(seconds: 2);

  late final PageController _controller = PageController();
  final Map<String, String> _extraResolved = {};
  int _page = 0;
  Timer? _auto;

  List<String> get _locals {
    final out = <String>[];
    for (final p in widget.paths) {
      final local = widget.resolved[p] ?? _extraResolved[p];
      if (local != null && File(local).existsSync()) out.add(local);
    }
    return out;
  }

  @override
  void initState() {
    super.initState();
    _ensureResolved();
    WidgetsBinding.instance.addPostFrameCallback((_) => _restartAuto());
  }

  @override
  void didUpdateWidget(covariant _PhotoThumb oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_samePaths(oldWidget.paths, widget.paths)) {
      _page = 0;
      if (_controller.hasClients) _controller.jumpToPage(0);
      _ensureResolved();
      _restartAuto();
    } else if (oldWidget.resolved != widget.resolved) {
      _restartAuto();
    }
  }

  @override
  void dispose() {
    _auto?.cancel();
    _controller.dispose();
    super.dispose();
  }

  bool _samePaths(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  Future<void> _ensureResolved() async {
    final pending = <String>[
      for (final p in widget.paths)
        if (p.isNotEmpty &&
            !widget.resolved.containsKey(p) &&
            !_extraResolved.containsKey(p))
          p,
    ];
    if (pending.isEmpty) return;
    final got = await EInvoiceConnector.instance.resolvePhotoPaths(pending);
    if (!mounted || got.isEmpty) return;
    setState(() => _extraResolved.addAll(got));
    _restartAuto();
  }

  void _restartAuto() {
    _auto?.cancel();
    if (_locals.length < 2) return;
    _auto = Timer.periodic(_autoInterval, (_) {
      if (!mounted || !_controller.hasClients || _locals.length < 2) return;
      final next = (_page + 1) % _locals.length;
      _controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    });
  }

  void _goTo(int index) {
    if (!_controller.hasClients) return;
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
    _restartAuto();
  }

  Widget _placeholder() => Container(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: const Center(
          child: Icon(Icons.inventory_2_outlined, size: 28),
        ),
      );

  Widget _image(String path) => Image.file(
        File(path),
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (_, _, _) => _placeholder(),
      );

  Widget _navButton({
    required IconData icon,
    required VoidCallback onPressed,
    required bool compact,
  }) {
    return Material(
      color: Colors.black45,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.all(compact ? 2 : 4),
          child: Icon(icon, size: compact ? 14 : 18, color: Colors.white),
        ),
      ),
    );
  }

  Widget _dots(int count, {required bool compact}) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: compact ? 3 : 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(count, (i) {
          final active = i == _page;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            margin: const EdgeInsets.symmetric(horizontal: 2),
            width: active ? (compact ? 6 : 8) : (compact ? 5 : 6),
            height: active ? (compact ? 6 : 8) : (compact ? 5 : 6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: active
                  ? Colors.white
                  : Colors.white.withValues(alpha: 0.55),
              boxShadow: const [
                BoxShadow(color: Color(0x88000000), blurRadius: 2),
              ],
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final photos = _locals;
    final multi = photos.length > 1;
    final compact = !widget.expand;

    late final Widget child;
    if (photos.isEmpty) {
      child = GestureDetector(onTap: widget.onTap, child: _placeholder());
    } else if (!multi) {
      child = GestureDetector(onTap: widget.onTap, child: _image(photos.first));
    } else {
      child = Stack(
        fit: StackFit.expand,
        children: [
          NotificationListener<ScrollNotification>(
            // Empêche le ListView/GridView parent d'avaler le swipe horizontal.
            onNotification: (n) => true,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.trackpad,
                  PointerDeviceKind.stylus,
                },
                scrollbars: false,
              ),
              child: PageView.builder(
                controller: _controller,
                itemCount: photos.length,
                onPageChanged: (i) => setState(() => _page = i),
                itemBuilder: (_, i) =>
                    GestureDetector(onTap: widget.onTap, child: _image(photos[i])),
              ),
            ),
          ),
          Positioned(
            left: compact ? 2 : 6,
            top: 0,
            bottom: 0,
            child: Center(
              child: _navButton(
                icon: Icons.chevron_left,
                compact: compact,
                onPressed: () =>
                    _goTo((_page - 1 + photos.length) % photos.length),
              ),
            ),
          ),
          Positioned(
            right: compact ? 2 : 6,
            top: 0,
            bottom: 0,
            child: Center(
              child: _navButton(
                icon: Icons.chevron_right,
                compact: compact,
                onPressed: () => _goTo((_page + 1) % photos.length),
              ),
            ),
          ),
          _dots(photos.length, compact: compact),
        ],
      );
    }

    if (widget.expand) return child;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(width: widget.size, height: widget.size, child: child),
    );
  }
}

class _EiProductEditScreen extends StatefulWidget {
  const _EiProductEditScreen({this.product});
  final EiProduct? product;

  @override
  State<_EiProductEditScreen> createState() => _EiProductEditScreenState();
}

/// Fiche produit — même structure / champs que ProductEditScreen (e-Invoicing).
class _EiProductEditScreenState extends State<_EiProductEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionKey = GlobalKey<JoditEditorState>();
  final _scrollController = ScrollController();
  late final TextEditingController _notesCtrl;
  bool _saving = false;
  bool _photosBusy = false;
  bool _ready = false;
  String _sellerCountry = 'BE';

  late String _ref;
  late String _name;
  late final String _initialDescription;
  late String _hsCode;
  late double _taxRate;
  late String _taxNote;
  late double _salePrice;
  late List<String> _photos;
  late String _cfop;
  late String _cstIcms;
  late String _cstPisCofins;

  bool get _isNew => widget.product == null;

  double get _priceInclTax => _salePrice * (1 + _taxRate / 100);

  @override
  void initState() {
    super.initState();
    final src = widget.product;
    _ref = src?.ref ?? '';
    _name = src?.name ?? '';
    _initialDescription = src?.description ?? '';
    _hsCode = src?.hsCode ?? '';
    _taxRate = src?.taxRate ?? 0;
    _taxNote = src?.taxNote ?? '';
    _salePrice = src?.salePrice ?? 0;
    _photos = List.of(src?.photoPaths ?? const []);
    _notesCtrl = TextEditingController(text: notesPlainText(src?.notes));
    _cfop = src?.cfop ?? '';
    _cstIcms = src?.cstIcms ?? '';
    _cstPisCofins = src?.cstPisCofins ?? '';
    _bootstrap();
  }

  @override
  void dispose() {
    _notesCtrl.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _bootstrap() async {
    final defaults =
        await EInvoiceConnector.instance.loadSellerProductDefaults();
    if (!mounted) return;
    setState(() {
      _sellerCountry = defaults.countryCode;
      if (_isNew && _taxRate == 0 && defaults.defaultVatRate > 0) {
        _taxRate = defaults.defaultVatRate;
      }
      _ready = true;
    });
  }

  Future<void> _save() async {
    final l10n = AppLocalizations.of(context);
    if (_photosBusy) return;
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.eiNameRequired)),
      );
      if (_scrollController.hasClients) {
        await _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOut,
        );
      }
      return;
    }
    _formKey.currentState!.save();
    setState(() => _saving = true);
    try {
      await EInvoiceConnector.instance.upsertCatalogProduct(
        id: widget.product?.id,
        uuid: widget.product?.uuid,
        name: _name,
        ref: _ref,
        description:
            notesHtmlOrNull(_descriptionKey.currentState?.getHtml()) ?? '',
        hsCode: _hsCode,
        taxRate: _taxRate,
        taxNote: _taxNote,
        salePrice: _salePrice,
        photoPaths: _photos,
        notes: _notesCtrl.text.trim(),
        cfop: _cfop,
        cstIcms: _cstIcms,
        cstPisCofins: _cstPisCofins,
      );
      if (mounted) Navigator.pop(context, true);
    } on DuplicateProductRefException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.eiRefAlreadyUsed(e.ref)),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.eiSaveFailed('$e'))),
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _delete() async {
    final l10n = AppLocalizations.of(context);
    final p = widget.product;
    if (p == null) return;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.eiDeleteProductTitle),
        content: Text(p.name),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.commonDelete),
          ),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    setState(() => _saving = true);
    try {
      await EInvoiceConnector.instance
          .deleteCatalogProduct(id: p.id, uuid: p.uuid);
      if (mounted) Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.eiDeleteFailed('$e'))),
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  String get _taxName => salesTaxLabelForCountry(_sellerCountry);

  String get _hsLabel => hsCodeLabelForCountry(_sellerCountry);

  bool _compact(BuildContext context, [BoxConstraints? c]) {
    final w = MediaQuery.sizeOf(context).width;
    if (w < 700) return true;
    if (c != null && c.maxWidth < 560) return true;
    return false;
  }

  Widget _field(
    String label,
    String initial,
    ValueChanged<String> onChanged, {
    TextInputType? keyboard,
    int maxLines = 1,
    String? Function(String?)? validator,
    String? hint,
    TextAlign textAlign = TextAlign.start,
    bool isLast = false,
    bool autofocus = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
      child: DictationFormField(
        initialValue: initial,
        maxLines: maxLines,
        keyboardType: keyboard,
        textAlign: textAlign,
        validator: validator,
        autofocus: autofocus,
        label: label,
        hint: hint,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        onSaved: (v) => onChanged(v?.trim() ?? ''),
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF2BA89A);
    final l10n = AppLocalizations.of(context);
    final title = _isNew ? l10n.eiNewProduct : l10n.eiEditProductTitle;
    if (!_ready) {
      return Scaffold(
        appBar: EiEastmarkAppBar(title: title),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    final taxLabel = l10n.eiTaxRate(_taxName);
    final hsLabel = _hsLabel;
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.keyS, meta: true): _save,
        const SingleActivator(LogicalKeyboardKey.keyS, control: true): _save,
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F6F5),
        appBar: EiEastmarkAppBar(
          title: title,
          actions: [
            if (!_isNew)
              IconButton(
                tooltip: l10n.commonDelete,
                onPressed: _saving ? null : _delete,
                icon: const Icon(Icons.delete_outline, color: Color(0xFFB42318)),
              ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
            children: [
              SectionCard(
                title: l10n.eiInfoSection,
                platformViewSafe: true,
                children: [
                  if (_compact(context)) ...[
                    _field(
                      l10n.eiRefLabel,
                      _ref,
                      (v) => _ref = v,
                      hint: l10n.eiRefHint,
                    ),
                    _field(
                      l10n.eiNameLabel,
                      _name,
                      (v) => _name = v,
                      autofocus: _isNew,
                      validator: (v) => (v == null || v.trim().isEmpty)
                          ? l10n.eiNameRequired
                          : null,
                    ),
                  ] else
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: _field(
                            l10n.eiRefLabel,
                            _ref,
                            (v) => _ref = v,
                            hint: l10n.eiRefHint,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 3,
                          child: _field(
                            l10n.eiNameLabel,
                            _name,
                            (v) => _name = v,
                            autofocus: _isNew,
                            validator: (v) =>
                                (v == null || v.trim().isEmpty)
                                    ? l10n.eiNameRequired
                                    : null,
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.eiDescriptionLabel,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    height: 320,
                    child: JoditEditor(
                      key: _descriptionKey,
                      initialHtml: _initialDescription,
                    ),
                  ),
                ],
              ),
              SectionCard(
                title: l10n.eiPriceSection,
                children: [
                  LayoutBuilder(builder: (context, c) {
                    final compact = _compact(context, c);
                    final hs = _field(
                      hsLabel,
                      _hsCode,
                      (v) => _hsCode = v,
                      hint: l10n.eiOptional,
                      isLast: true,
                    );
                    final price = _field(
                      l10n.eiPriceExclTax,
                      _salePrice == 0 ? '' : _salePrice.toStringAsFixed(2),
                      (v) => setState(() => _salePrice =
                          double.tryParse(v.replaceAll(',', '.')) ?? 0),
                      keyboard: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      textAlign: TextAlign.center,
                      isLast: true,
                    );
                    final tax = _field(
                      taxLabel,
                      _taxRate == 0 ? '' : formatNumber(_taxRate),
                      (v) => setState(() => _taxRate =
                          double.tryParse(v.replaceAll(',', '.')) ?? 0),
                      keyboard: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      textAlign: TextAlign.center,
                      isLast: true,
                    );
                    final incl = Padding(
                      padding: EdgeInsets.zero,
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: l10n.eiSellPrice,
                          border: const OutlineInputBorder(),
                        ),
                        child: Text(
                          _salePrice == 0 && _taxRate == 0
                              ? '—'
                              : formatAmount(_priceInclTax),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: teal,
                          ),
                        ),
                      ),
                    );
                    if (!compact) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: hs),
                          const SizedBox(width: 12),
                          Expanded(child: price),
                          const SizedBox(width: 12),
                          Expanded(child: tax),
                          const SizedBox(width: 12),
                          Expanded(child: incl),
                        ],
                      );
                    }
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: price),
                            const SizedBox(width: 12),
                            Expanded(child: incl),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 7, child: hs),
                            const SizedBox(width: 12),
                            Expanded(flex: 3, child: tax),
                          ],
                        ),
                      ],
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: _field(
                      l10n.eiTaxNote,
                      _taxNote,
                      (v) => _taxNote = v,
                      maxLines: 2,
                      isLast: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      l10n.eiHsInfo,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                    ),
                  ),
                ],
              ),
              if (_sellerCountry == 'BR')
                SectionCard(
                  title: l10n.eiNfeSection,
                  children: [
                    LayoutBuilder(builder: (context, c) {
                      final compact = _compact(context, c);
                      final cfop = _field(
                        l10n.eiCfop,
                        _cfop,
                        (v) => _cfop = v,
                        hint: l10n.eiCfopHint,
                        isLast: true,
                      );
                      final cstIcms = _field(
                        l10n.eiIcmsCst,
                        _cstIcms,
                        (v) => _cstIcms = v,
                        hint: l10n.eiIcmsCstHint,
                        isLast: true,
                      );
                      final cstPis = _field(
                        l10n.eiPisCofins,
                        _cstPisCofins,
                        (v) => _cstPisCofins = v,
                        hint: l10n.eiPisCofinsHint,
                        isLast: true,
                      );
                      if (!compact) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: cfop),
                            const SizedBox(width: 12),
                            Expanded(child: cstIcms),
                            const SizedBox(width: 12),
                            Expanded(child: cstPis),
                          ],
                        );
                      }
                      return Column(
                        children: [
                          cfop,
                          const SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: cstIcms),
                              const SizedBox(width: 12),
                              Expanded(child: cstPis),
                            ],
                          ),
                        ],
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        l10n.eiNfeOverrideHint,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                      ),
                    ),
                  ],
                ),
              SectionCard(
                title: l10n.eiPhotosSection,
                icon: Icons.photo_library_outlined,
                children: [
                  EiProductPhotosPicker(
                    photoPaths: _photos,
                    onChanged: (paths) => setState(() => _photos = paths),
                    onBusyChanged: (busy) =>
                        setState(() => _photosBusy = busy),
                  ),
                ],
              ),
              SectionCard(
                title: l10n.eiNotesSection,
                children: [
                  DictationField(
                    controller: _notesCtrl,
                    label: l10n.commonNotesLabel,
                    maxLines: 6,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFFDC2626),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _saving ? null : () => Navigator.pop(context),
                    child: Text(l10n.commonCancel),
                  ),
                  const SizedBox(width: 12),
                  FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: teal,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: (_saving || _photosBusy) ? null : _save,
                    icon: (_saving || _photosBusy)
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(Icons.check),
                    label: Text(l10n.eiSaveShortcut),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
