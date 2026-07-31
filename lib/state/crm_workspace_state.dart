import 'package:flutter/foundation.dart';

import '../core/models/models.dart';

/// Section active dans le workspace.
enum CrmSection { dashboard, today, clients, pipeline, tasks }

/// État partagé du workspace — sélection client, tâche, section.
class CrmWorkspaceState extends ChangeNotifier {
  CrmSection section = CrmSection.dashboard;
  String? selectedCompanyId;
  String? selectedTaskId;
  /// Sur « Aujourd'hui », ouvrir la fiche complète au lieu du panneau relance.
  bool todayFullRecord = false;
  int _version = 0;

  int get version => _version;

  void goTo(CrmSection s) {
    section = s;
    if (s != CrmSection.today && s != CrmSection.dashboard) {
      selectedTaskId = null;
      todayFullRecord = false;
    }
    notifyListeners();
  }

  void selectCompany(String? id) {
    selectedCompanyId = id;
    selectedTaskId = null;
    todayFullRecord = false;
    notifyListeners();
  }

  void selectTask(CrmTask task) {
    selectedTaskId = task.id;
    selectedCompanyId = task.companyId;
    todayFullRecord = false;
    notifyListeners();
  }

  void openFullCompanyRecord() {
    todayFullRecord = true;
    notifyListeners();
  }

  void clearSelection() {
    selectedCompanyId = null;
    selectedTaskId = null;
    todayFullRecord = false;
    notifyListeners();
  }

  void bump() {
    _version++;
    notifyListeners();
  }
}
