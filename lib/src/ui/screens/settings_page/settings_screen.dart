import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _connectionNameController = TextEditingController();
  final _uuidController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _connectionNameController.text = prefs.getString('connectionName') ?? 'RestNow_BLE';
      _uuidController.text = prefs.getString('uuid') ?? '0000180d-0000-1000-8000-00805f9b34fb';
    });
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('connectionName', _connectionNameController.text);
    await prefs.setString('uuid', _uuidController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Налаштування збережено')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLE Налаштування')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _connectionNameController,
              decoration: const InputDecoration(labelText: 'Назва з’єднання'),
            ),
            TextField(
              controller: _uuidController,
              decoration: const InputDecoration(labelText: 'UUID пристрою'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveSettings,
              child: const Text('Зберегти'),
            ),
          ],
        ),
      ),
    );
  }
}
