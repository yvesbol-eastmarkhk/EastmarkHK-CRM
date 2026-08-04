import 'package:flutter_test/flutter_test.dart';

import 'package:eastmarkhk_crm/core/models/models.dart';
import 'package:eastmarkhk_crm/state/crm_workspace_state.dart';

CrmTask _task({String id = 'task-1', String? companyId}) => CrmTask(
      id: id,
      companyId: companyId,
      title: 'Relancer',
      createdAt: '2026-01-01T00:00:00.000Z',
      updatedAt: '2026-01-01T00:00:00.000Z',
    );

void main() {
  late CrmWorkspaceState state;

  setUp(() {
    state = CrmWorkspaceState();
  });

  test('starts on the dashboard with nothing selected', () {
    expect(state.section, CrmSection.dashboard);
    expect(state.selectedCompanyId, isNull);
    expect(state.selectedTaskId, isNull);
    expect(state.selectedOpportunityId, isNull);
    expect(state.activeModuleId, isNull);
  });

  test('selectOpportunity opens the deal panel without clearing the company', () {
    // The deal panel is meant to coexist with a selected company (it takes
    // priority in the detail panel), so selecting an opportunity must not
    // wipe out selectedCompanyId — losing that would break the "back to
    // company" flow from an opportunity.
    state.selectCompany('company-1');
    state.selectOpportunity('opp-1');
    expect(state.selectedOpportunityId, 'opp-1');
    expect(state.selectedCompanyId, 'company-1');
  });

  test('selectCompany clears any open opportunity and task', () {
    state.selectOpportunity('opp-1');
    state.selectTask(_task(companyId: 'company-2'));

    state.selectCompany('company-1');

    expect(state.selectedCompanyId, 'company-1');
    expect(state.selectedOpportunityId, isNull);
    expect(state.selectedTaskId, isNull);
  });

  test('selectTask also selects the task\'s company and clears the opportunity', () {
    state.selectOpportunity('opp-1');

    state.selectTask(_task(id: 'task-9', companyId: 'company-7'));

    expect(state.selectedTaskId, 'task-9');
    expect(state.selectedCompanyId, 'company-7');
    expect(state.selectedOpportunityId, isNull);
  });

  test('goTo(dashboard) clears company/opportunity selection', () {
    state.selectCompany('company-1');
    state.selectOpportunity('opp-1');

    state.goTo(CrmSection.dashboard);

    expect(state.section, CrmSection.dashboard);
    expect(state.selectedCompanyId, isNull);
    expect(state.selectedOpportunityId, isNull);
  });

  test('goTo(clients) keeps company selection but clears the opportunity panel', () {
    state.selectCompany('company-1');
    state.selectOpportunity('opp-1');

    state.goTo(CrmSection.clients);

    expect(state.section, CrmSection.clients);
    expect(state.selectedCompanyId, 'company-1');
    expect(state.selectedOpportunityId, isNull);
  });

  test('goTo(today) preserves an already-selected task', () {
    state.selectTask(_task(id: 'task-1'));
    state.goTo(CrmSection.today);
    expect(state.selectedTaskId, 'task-1');
  });

  test('goTo(a non-today section) clears the selected task and full-record flag', () {
    state.selectTask(_task(id: 'task-1'));
    state.openFullCompanyRecord();

    state.goTo(CrmSection.pipeline);

    expect(state.selectedTaskId, isNull);
    expect(state.todayFullRecord, isFalse);
  });

  test('goToModule clears task and opportunity selection', () {
    state.selectTask(_task(id: 'task-1'));
    state.selectOpportunity('opp-1');

    state.goToModule('invoicing');

    expect(state.activeModuleId, 'invoicing');
    expect(state.selectedTaskId, isNull);
    expect(state.selectedOpportunityId, isNull);
  });

  test('clearSelection resets every selection field', () {
    state.selectCompany('company-1');
    state.selectTask(_task(id: 'task-1', companyId: 'company-1'));
    state.selectOpportunity('opp-1');
    state.openFullCompanyRecord();

    state.clearSelection();

    expect(state.selectedCompanyId, isNull);
    expect(state.selectedTaskId, isNull);
    expect(state.selectedOpportunityId, isNull);
    expect(state.todayFullRecord, isFalse);
  });

  test('bump increments version and notifies listeners', () {
    var notified = 0;
    state.addListener(() => notified++);

    expect(state.version, 0);
    state.bump();
    expect(state.version, 1);
    expect(notified, 1);
  });

  test('every mutating method notifies listeners', () {
    var notified = 0;
    state.addListener(() => notified++);

    state.selectCompany('company-1');
    state.selectOpportunity('opp-1');
    state.selectTask(_task(id: 'task-1'));
    state.goTo(CrmSection.pipeline);
    state.goToModule('invoicing');
    state.openFullCompanyRecord();
    state.clearSelection();

    expect(notified, 7);
  });
}
