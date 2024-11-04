import 'package:flutter/material.dart';
import 'package:restnow_controller/src/ui/screens/home_page/home_screen.dart';
import 'package:restnow_controller/src/ui/screens/settings_page/settings_screen.dart';
import 'package:restnow_controller/src/widgets/bottom_nav_bar.dart';
import 'package:restnow_controller/services/ble_service.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final bleService = BLEService();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => BottomNavBar(bleService: bleService));
      case '/settings':
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen(bleService: bleService));
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('PAGE NOT FOUND')),
          ),
        );
    }
  }
}
