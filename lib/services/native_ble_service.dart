import 'package:flutter/services.dart';

class NativeBLEService {
  static const platform = MethodChannel('com.example.restnow_controller');

  Future<void> startPeripheralMode(String connectionName, String uuid) async {
    try {
      await platform.invokeMethod('startPeripheralMode', {
        'connectionName': connectionName,
        'uuid': uuid,
      });
    } on PlatformException catch (e) {
      print("Failed to start peripheral mode: '${e.message}'.");
    }
  }

  Future<void> stopPeripheralMode() async {
    try {
      await platform.invokeMethod('stopPeripheralMode');
    } on PlatformException catch (e) {
      print("Failed to stop peripheral mode: '${e.message}'.");
    }
  }
}
