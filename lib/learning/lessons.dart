import 'package:flutter/widgets.dart';
import 'package:first_flutter_app/learning/labs/lab_t001_app_entry.dart';
import 'package:first_flutter_app/learning/labs/lab_t002_stateless_text.dart';
import 'package:first_flutter_app/learning/labs/lab_t003_stateful_counter.dart';
import 'package:first_flutter_app/learning/labs/lab_t004_basic_layout.dart';
import 'package:first_flutter_app/learning/labs/lab_t005_text_field_input.dart';
import 'package:first_flutter_app/learning/labs/lab_t006_form_validation.dart';
import 'package:first_flutter_app/learning/labs/lab_t007_toggle_inputs.dart';
import 'package:first_flutter_app/learning/labs/lab_t008_dropdown_selection.dart';
import 'package:first_flutter_app/learning/labs/lab_t009_radio_selection.dart';
import 'package:first_flutter_app/learning/labs/lab_t010_slider_input.dart';
import 'package:first_flutter_app/learning/labs/lab_t011_gesture_input.dart';
import 'package:first_flutter_app/learning/labs/lab_t012_dismissible_list.dart';
import 'package:first_flutter_app/learning/labs/lab_t013_navigation_detail.dart';
import 'package:first_flutter_app/learning/labs/lab_t014_navigation_result.dart';

class LessonDefinition {
  const LessonDefinition({
    required this.id,
    required this.title,
    required this.summary,
    required this.builder,
  });

  final String id;
  final String title;
  final String summary;
  final WidgetBuilder builder;
}

final List<LessonDefinition> lessons = [
  LessonDefinition(
    id: 'T-001',
    title: 'App Entry',
    summary: 'main, runApp, MaterialApp',
    builder: (_) => const LabT001AppEntry(),
  ),
  LessonDefinition(
    id: 'T-002',
    title: 'Stateless Text',
    summary: 'StatelessWidget and Text',
    builder: (_) => const LabT002StatelessText(),
  ),
  LessonDefinition(
    id: 'T-003',
    title: 'Stateful Counter',
    summary: 'StatefulWidget and setState',
    builder: (_) => const LabT003StatefulCounter(),
  ),
  LessonDefinition(
    id: 'T-004',
    title: 'Basic Layout',
    summary: 'Row, Column, Expanded',
    builder: (_) => const LabT004BasicLayout(),
  ),
  LessonDefinition(
    id: 'T-005',
    title: 'TextField Input',
    summary: 'TextField and controller',
    builder: (_) => const LabT005TextFieldInput(),
  ),
  LessonDefinition(
    id: 'T-006',
    title: 'Form Validation',
    summary: 'Form, validator, submit',
    builder: (_) => const LabT006FormValidation(),
  ),
  LessonDefinition(
    id: 'T-007',
    title: 'Toggle Inputs',
    summary: 'Checkbox and Switch',
    builder: (_) => const LabT007ToggleInputs(),
  ),
  LessonDefinition(
    id: 'T-008',
    title: 'Dropdown Selection',
    summary: 'DropdownButton and selected value',
    builder: (_) => const LabT008DropdownSelection(),
  ),
  LessonDefinition(
    id: 'T-009',
    title: 'Radio Selection',
    summary: 'RadioGroup and RadioListTile',
    builder: (_) => const LabT009RadioSelection(),
  ),
  LessonDefinition(
    id: 'T-010',
    title: 'Slider Input',
    summary: 'Slider and numeric state',
    builder: (_) => const LabT010SliderInput(),
  ),
  LessonDefinition(
    id: 'T-011',
    title: 'Gesture Input',
    summary: 'GestureDetector and InkWell',
    builder: (_) => const LabT011GestureInput(),
  ),
  LessonDefinition(
    id: 'T-012',
    title: 'Dismissible List',
    summary: 'Dismissible and swipe delete',
    builder: (_) => const LabT012DismissibleList(),
  ),
  LessonDefinition(
    id: 'T-013',
    title: 'Navigation Detail',
    summary: 'Navigator.push and detail screen',
    builder: (_) => const LabT013NavigationDetail(),
  ),
  LessonDefinition(
    id: 'T-014',
    title: 'Navigation Result',
    summary: 'Navigator.pop with result',
    builder: (_) => const LabT014NavigationResult(),
  ),
];
