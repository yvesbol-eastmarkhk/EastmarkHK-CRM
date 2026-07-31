/// Reporte les pulls automatiques tant qu'une saisie est en cours —
/// même logique qu'e-Invoicing ([HomeShell._isUserEditing]).
class SyncEditingGuard {
  SyncEditingGuard._();

  static bool Function()? isUserEditing;

  static bool get shouldDeferPull => isUserEditing?.call() ?? false;
}
