import 'package:flutter/material.dart';
import 'package:restnow_controller/routing/router.dart';

void main() {
  runApp(const RestNowEmulatorApp());
}

class RestNowEmulatorApp extends StatelessWidget {
  const RestNowEmulatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RestNow Emulator',
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: '/',
    );
  }
}
