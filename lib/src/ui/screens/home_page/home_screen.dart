import 'package:flutter/material.dart';
import 'package:restnow_controller/services/ble_service.dart';
import 'package:restnow_controller/services/native_ble_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.bleService});

  final BLEService bleService;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDeviceOn = false;
  final NativeBLEService _nativeBLEService = NativeBLEService();

  @override
  void initState() {
    super.initState();
    widget.bleService.addListener(_updateStatus);
  }

  @override
  void dispose() {
    widget.bleService.removeListener(_updateStatus);
    super.dispose();
  }

  void _updateStatus() {
    setState(() {});
  }

  void _toggleDevice() {
    setState(() {
      _isDeviceOn = !_isDeviceOn;
      widget.bleService.handleCommand(_isDeviceOn ? 'Start' : 'Stop');

      if (_isDeviceOn) {
        _nativeBLEService.startPeripheralMode('RestNow_BLE', '0000180d-0000-1000-8000-00805f9b34fb');
      } else {
        _nativeBLEService.stopPeripheralMode();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Емулятор RestNow')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Статус пристрою: ${widget.bleService.status}'),
          const SizedBox(height: 20),
          SwitchListTile(
            title: Text(_isDeviceOn ? 'ON' : 'OFF'),
            value: _isDeviceOn,
            onChanged: (bool value) {
              _toggleDevice();
            },
          ),
        ],
      ),
    );
  }
}
