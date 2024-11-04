import 'package:flutter/material.dart';
import 'package:restnow_controller/src/ui/screens/home_page/home_screen.dart';
import 'package:restnow_controller/src/ui/screens/settings_page/settings_screen.dart';
import 'package:restnow_controller/services/ble_service.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, required this.bleService});

  final BLEService bleService;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens.add(HomeScreen(bleService: widget.bleService));
    _screens.add(SettingsScreen());
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Головна'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Налаштування'),
        ],
      ),
    );
  }
}
