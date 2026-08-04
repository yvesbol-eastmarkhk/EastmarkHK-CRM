import 'package:flutter/foundation.dart';

import '../core/models/models.dart';

/// Section active dans le workspace.
enum CrmSection { dashboard, today, clients, pipeline, tasks }

/// État partagé du workspace — sélection client, tâche, section.
class CrmWorkspaceState extends ChangeNotifier {
  CrmSection section = CrmSection.dashboard;
  /// Module actif (ex. `invoicing`) — remplace la section cœur dans le panneau principal.
  String? activeModuleId;
  String? selectedCompanyId;
  String? selectedTaskId;
  /// Affaire ouverte dans le panneau détail (timeline unifiée) — coexiste
  /// avec [selectedCompanyId] mais prend le pas dessus dans le panneau
  /// détail, pour rester dans le workspace 3-panneaux (pas de plein écran).
  String? selectedOpportunityId;
  /// Sur « Aujourd'hui », ouvrir la fiche complète au lieu du panneau relance.
  bool todayFullRecord = false;
  int _version = 0;

  int get version => _version;

  void goTo(CrmSection s) {
    section = s;
    activeModuleId = null;
    selectedOpportunityId = null;
    // Garde la sélection tâche sur Aujourd'hui et Tâches (aperçu à droite).
    if (s != CrmSection.today && s != CrmSection.tasks) {
      selectedTaskId = null;
      todayFullRecord = false;
    }
    if (s == CrmSection.dashboard) {
      // Le tableau de bord n'affiche jamais de fiche société/tâche : sans ce
      // nettoyage, une sélection faite dans « Aujourd'hui » (auto-sélection
      // de la 1ère tâche au chargement, qui pose aussi selectedCompanyId)
      // restait active et le panneau affichait la fiche société à la place
      // du dashboard en y revenant — d'où la mise en page « en pagaille ».
      selectedCompanyId = null;
      selectedTaskId = null;
      todayFullRecord = false;
    }
    notifyListeners();
  }

  void goToModule(String moduleId) {
    activeModuleId = moduleId;
    selectedTaskId = null;
    selectedOpportunityId = null;
    todayFullRecord = false;
    notifyListeners();
  }

  void selectCompany(String? id) {
    selectedCompanyId = id;
    selectedTaskId = null;
    selectedOpportunityId = null;
    todayFullRecord = false;
    notifyListeners();
  }

  void selectTask(CrmTask task) {
    // Aperçu tâche seulement sur Aujourd'hui / Tâches — bascule si besoin
    // (ex. création depuis le dashboard / palette).
    if (section != CrmSection.today && section != CrmSection.tasks) {
      section = CrmSection.tasks;
      activeModuleId = null;
    }
    selectedTaskId = task.id;
    selectedCompanyId = task.companyId;
    selectedOpportunityId = null;
    todayFullRecord = false;
    notifyListeners();
  }

  /// Ouvre la fiche d'affaire (timeline unifiée) dans le panneau détail.
  void selectOpportunity(String? id) {
    selectedOpportunityId = id;
    notifyListeners();
  }

  void openFullCompanyRecord() {
    todayFullRecord = true;
    notifyListeners();
  }

  void clearSelection() {
    selectedCompanyId = null;
    selectedTaskId = null;
    selectedOpportunityId = null;
    todayFullRecord = false;
    notifyListeners();
  }

  void bump() {
    _version++;
    notifyListeners();
  }
}
