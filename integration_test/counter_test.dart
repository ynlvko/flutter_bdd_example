// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import './../test/step/iprelude.dart';
import './../test/step/the_app_is_running.dart';
import './../test/step/i_see_text.dart';
import './../test/step/i_tap_text.dart';
import './../test/step/i_wait.dart';
import './../test/step/i_swipe_from_top_to_bottom.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('''Counter''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await iprelude(tester);
      await theAppIsRunning(tester);
    }
    testWidgets('''HomePage has "Go to Account" button''', (tester) async {
      await bddSetUp(tester);
      await iSeeText(tester, 'Go to Account');
    });
    testWidgets('''AccountPage shows account information''', (tester) async {
      await bddSetUp(tester);
      await iTapText(tester, 'Go to Account');
      await iWait(tester);
      await iSwipeFromTopToBottom(tester);
      await iSeeText(tester, 'Philip');
      await iSeeText(tester, 'Fry');
    });
    testWidgets('''InfoPage shows company name''', (tester) async {
      await bddSetUp(tester);
      await iTapText(tester, 'Go to Info');
      await iWait(tester);
      await iSwipeFromTopToBottom(tester);
      await iSeeText(tester, 'SoftContruct');
    });
  });
}
