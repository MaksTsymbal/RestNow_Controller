import 'package:flutter/material.dart';

class BLEService extends ChangeNotifier {
  String status = 'Очікування';

  void handleCommand(String command) {
    switch (command) {
      case 'Start':
        status = 'Активований';
        break;
      case 'Stop':
        status = 'Очікування';
        break;
      case 'Pause':
        status = 'Пауза';
        break;
      case 'Continue':
        status = 'Активований';
        break;
      default:
        status = 'Невідома команда';
    }
    notifyListeners();
  }
}
