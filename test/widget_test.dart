import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:first_flutter_app/learning/labs/lab_t001_app_entry.dart';
import 'package:first_flutter_app/learning/labs/lab_t005_text_field_input.dart';
import 'package:first_flutter_app/learning/labs/lab_t006_form_validation.dart';
import 'package:first_flutter_app/learning/labs/lab_t007_toggle_inputs.dart';
import 'package:first_flutter_app/learning/labs/lab_t008_dropdown_selection.dart';
import 'package:first_flutter_app/learning/labs/lab_t009_radio_selection.dart';
import 'package:first_flutter_app/learning/labs/lab_t010_slider_input.dart';
import 'package:first_flutter_app/learning/labs/lab_t011_gesture_input.dart';
import 'package:first_flutter_app/learning/labs/lab_t012_dismissible_list.dart';
import 'package:first_flutter_app/learning/labs/lab_t013_navigation_detail.dart';
import 'package:first_flutter_app/learning/home_screen.dart';
import 'package:first_flutter_app/learning/lessons.dart';
import 'package:first_flutter_app/learning/practice/practice_p001.dart';
import 'package:first_flutter_app/learning/practices.dart';
import 'package:first_flutter_app/main.dart';

void main() {
  testWidgets('MyApp renders learning home sections', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.byType(GridView), findsWidgets);
    expect(find.text('Flutter Learning'), findsOneWidget);
    expect(find.text('Lessons'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('Practice'),
      500,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Practice'), findsOneWidget);
  });

  testWidgets('learning home shows registered lessons and practices', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    expect(lessons.length, 13);
    expect(lessons.last.id, 'T-013');
    expect(practices.length, greaterThanOrEqualTo(1));
    expect(find.text('T-001'), findsOneWidget);
    expect(find.text('T-002'), findsOneWidget);
    expect(find.text('T-003'), findsOneWidget);
    expect(find.text('T-004'), findsOneWidget);
    expect(find.text('T-005'), findsOneWidget);
    expect(find.text('T-006'), findsOneWidget);
    expect(find.text('T-007'), findsOneWidget);
    expect(find.text('T-008'), findsOneWidget);
    expect(find.text('T-009'), findsOneWidget);
    expect(find.text('T-010'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text(practices.first.id),
      500,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text(practices.first.id), findsOneWidget);
  });

  testWidgets('tapping a lesson opens that lesson screen', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    await tester.tap(find.text('T-005'));
    await tester.pumpAndSettle();

    expect(find.byType(LabT005TextFieldInput), findsOneWidget);
    expect(find.text('T-005 TextField Input'), findsOneWidget);
  });

  testWidgets('tapping a practice opens that practice screen', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    await tester.scrollUntilVisible(
      find.text(practices.first.id),
      500,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text(practices.first.id));
    await tester.pumpAndSettle();

    expect(find.byType(PracticeP001Screen), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets('T-001 lesson screen can navigate back to the grid', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    await tester.tap(find.text('T-001'));
    await tester.pumpAndSettle();

    expect(find.byType(LabT001AppEntry), findsOneWidget);
    expect(find.text('T-001 App Entry'), findsOneWidget);
    expect(find.byTooltip('Back'), findsOneWidget);

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.text('Flutter Learning'), findsOneWidget);
  });

  testWidgets('T-006 form shows validation error for empty input', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: LabT006FormValidation()));

    await tester.tap(find.text('Submit'));
    await tester.pump();

    expect(find.text('Name is required.'), findsOneWidget);
    expect(find.text('Submit the form to see the result.'), findsOneWidget);
  });

  testWidgets('T-006 form submits valid input', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LabT006FormValidation()));

    await tester.enterText(find.byType(TextFormField), 'Ada');
    await tester.tap(find.text('Submit'));
    await tester.pump();

    expect(find.text('Name is required.'), findsNothing);
    expect(find.text('Submitted: Ada'), findsOneWidget);
  });

  testWidgets('T-007 toggles checkbox and switch state', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LabT007ToggleInputs()));

    expect(find.byType(CheckboxListTile), findsOneWidget);
    expect(find.byType(SwitchListTile), findsOneWidget);
    expect(find.text('Terms not accepted'), findsOneWidget);
    expect(find.text('Notifications off'), findsOneWidget);

    await tester.tap(find.text('Accept terms'));
    await tester.pump();

    expect(find.text('Terms accepted'), findsOneWidget);

    await tester.tap(find.text('Enable notifications'));
    await tester.pump();

    expect(find.text('Notifications on'), findsOneWidget);
  });

  testWidgets('T-008 changes selected dropdown value', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: LabT008DropdownSelection()),
    );

    expect(find.byType(DropdownButtonFormField<String>), findsOneWidget);
    expect(find.text('Selected level: Beginner'), findsOneWidget);

    await tester.tap(find.text('Beginner'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Advanced').last);
    await tester.pumpAndSettle();

    expect(find.text('Selected level: Advanced'), findsOneWidget);
  });

  testWidgets('T-009 changes selected radio value', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LabT009RadioSelection()));

    expect(find.byType(RadioGroup<String>), findsOneWidget);
    expect(find.byType(RadioListTile<String>), findsNWidgets(3));
    expect(find.text('Selected plan: Basic'), findsOneWidget);

    await tester.tap(find.text('Premium'));
    await tester.pump();

    expect(find.text('Selected plan: Premium'), findsOneWidget);
  });

  testWidgets('T-010 changes slider numeric value', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LabT010SliderInput()));

    expect(find.byType(Slider), findsOneWidget);
    expect(find.text('Selected volume: 40'), findsOneWidget);

    await tester.drag(find.byType(Slider), const Offset(300, 0));
    await tester.pump();

    expect(find.text('Selected volume: 40'), findsNothing);
  });

  testWidgets('T-013 opens detail screen and returns to list', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LabT013NavigationDetail()));

    expect(find.text('T-013 Navigation Detail'), findsOneWidget);
    expect(find.text('Navigation basics'), findsOneWidget);
    expect(find.text('Route arguments'), findsOneWidget);
    expect(find.text('Back navigation'), findsOneWidget);

    await tester.tap(find.text('Route arguments'));
    await tester.pumpAndSettle();

    expect(find.text('Article Detail'), findsOneWidget);
    expect(find.text('Route arguments'), findsOneWidget);
    expect(
      find.text(
        'Detail: Constructor arguments keep the detail screen simple and explicit.',
      ),
      findsOneWidget,
    );
    expect(find.byTooltip('Back'), findsOneWidget);

    await tester.tap(find.byTooltip('Back'));
    await tester.pumpAndSettle();

    expect(find.text('T-013 Navigation Detail'), findsOneWidget);
    expect(find.text('Route arguments'), findsOneWidget);
  });
  testWidgets('T-012 removes an item with dismissible swipe', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: LabT012DismissibleList()));

    expect(find.byType(Dismissible), findsNWidgets(3));
    expect(find.text('Read docs'), findsOneWidget);
    expect(find.text('Write code'), findsOneWidget);
    expect(find.text('Run tests'), findsOneWidget);
    expect(find.text('Remaining items: 3'), findsOneWidget);
    expect(find.text('No item removed yet.'), findsOneWidget);

    await tester.drag(find.text('Read docs'), const Offset(500, 0));
    await tester.pumpAndSettle();

    expect(find.text('Read docs'), findsNothing);
    expect(find.byType(Dismissible), findsNWidgets(2));
    expect(find.text('Remaining items: 2'), findsOneWidget);
    expect(find.text('Removed: Read docs'), findsOneWidget);
  });
  testWidgets('T-011 records gesture detector and inkwell gestures', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: LabT011GestureInput()));

    expect(find.byType(GestureDetector), findsWidgets);
    expect(find.byType(InkWell), findsOneWidget);
    expect(find.text('Last gesture: No gesture yet.'), findsOneWidget);
    expect(find.text('Gesture count: 0'), findsOneWidget);

    await tester.tap(find.text('Tap, double tap, or long press this box'));
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text('Last gesture: GestureDetector tap'), findsOneWidget);
    expect(find.text('Gesture count: 1'), findsOneWidget);

    await tester.tap(find.text('Tap, double tap, or long press this box'));
    await tester.pump(const Duration(milliseconds: 100));
    await tester.tap(find.text('Tap, double tap, or long press this box'));
    await tester.pump(const Duration(milliseconds: 400));

    expect(
      find.text('Last gesture: GestureDetector double tap'),
      findsOneWidget,
    );
    expect(find.text('Gesture count: 2'), findsOneWidget);

    await tester.longPress(
      find.text('Tap, double tap, or long press this box'),
    );
    await tester.pump();

    expect(
      find.text('Last gesture: GestureDetector long press'),
      findsOneWidget,
    );
    expect(find.text('Gesture count: 3'), findsOneWidget);

    await tester.tap(find.text('Tap this InkWell area'));
    await tester.pump();

    expect(find.text('Last gesture: InkWell tap'), findsOneWidget);
    expect(find.text('Gesture count: 4'), findsOneWidget);
  });
}
