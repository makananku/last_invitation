import 'package:flutter/material.dart';
import 'screen/login_screen.dart';
import 'screen/dashboard_screen.dart';
import 'screen/guest_screen.dart';
import 'screen/rsvp_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lastinvitation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/guest': (context) => const GuestScreen(),
        '/rsvp': (context) => const RSVPScreen(),
      },
    );
  }
}