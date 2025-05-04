import 'package:flutter/material.dart';
import 'constants/app_constants.dart';
import 'screen/dashboard_screen.dart';
import 'screen/guest_screen.dart';
import 'screen/login_screen.dart';
import 'screen/rsvp_screen.dart';
import 'screen/setting_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppConstants.secondaryColor),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/guest': (context) => const GuestScreen(),
        '/rsvp': (context) => const RSVPScreen(),
        '/settings': (context) => const SettingScreen(),
      },
    );
  }
}