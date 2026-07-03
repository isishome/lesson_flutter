import 'package:flutter/material.dart';

class LabT007ToggleInputs extends StatefulWidget {
  const LabT007ToggleInputs({super.key});

  @override
  State<LabT007ToggleInputs> createState() => _LabT007ToggleInputsState();
}

class _LabT007ToggleInputsState extends State<LabT007ToggleInputs> {
  bool _acceptedTerms = false;
  bool _notificationsEnabled = false;

  void _setAcceptedTerms(bool? value) {
    setState(() {
      _acceptedTerms = value ?? false;
    });
  }

  void _setNotificationsEnabled(bool value) {
    setState(() {
      _notificationsEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final termsStatus = _acceptedTerms
        ? 'Terms accepted'
        : 'Terms not accepted';
    final notificationStatus = _notificationsEnabled
        ? 'Notifications on'
        : 'Notifications off';

    return Scaffold(
      appBar: AppBar(title: const Text('T-007 Toggle Inputs')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Checkbox and Switch store boolean state.'),
            const SizedBox(height: 12),
            CheckboxListTile(
              title: const Text('Accept terms'),
              value: _acceptedTerms,
              onChanged: _setAcceptedTerms,
            ),
            SwitchListTile(
              title: const Text('Enable notifications'),
              value: _notificationsEnabled,
              onChanged: _setNotificationsEnabled,
            ),
            const SizedBox(height: 24),
            Text(termsStatus),
            const SizedBox(height: 8),
            Text(notificationStatus),
          ],
        ),
      ),
    );
  }
}
