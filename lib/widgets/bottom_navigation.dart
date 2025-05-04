import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../screen/dashboard_screen.dart';
import '../screen/guest_screen.dart';
import '../screen/rsvp_screen.dart';
import '../screen/setting_screen.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final BuildContext parentContext;

  const CustomBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.parentContext,
  });

  void _handleNavigation(int index) {
    if (index == selectedIndex) return;

    switch (index) {
      case 0: // Dashboard
        if (ModalRoute.of(parentContext)?.settings.name != '/dashboard') {
          Navigator.pushReplacement(
            parentContext,
            MaterialPageRoute(
              builder: (context) => const DashboardScreen(),
              settings: const RouteSettings(name: '/dashboard'),
            ),
          );
        }
        break;
      case 1: // Guest
        Navigator.pushReplacement(
          parentContext,
          MaterialPageRoute(
            builder: (context) => const GuestScreen(),
            settings: const RouteSettings(name: '/guest'),
          ),
        );
        break;
      case 2: // Scan
        ScaffoldMessenger.of(parentContext).showSnackBar(
          const SnackBar(content: Text('QR Scanner not implemented yet')),
        );
        break;
      case 3: // RSVP
        Navigator.pushReplacement(
          parentContext,
          MaterialPageRoute(
            builder: (context) => const RSVPScreen(),
            settings: const RouteSettings(name: '/rsvp'),
          ),
        );
        break;
      case 4: // Settings
        Navigator.pushReplacement(
          parentContext,
          MaterialPageRoute(
            builder: (context) => const SettingScreen(),
            settings: const RouteSettings(name: '/settings'),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: AppConstants.primaryColor,
      unselectedItemColor: Colors.grey,
      currentIndex: selectedIndex,
      onTap: _handleNavigation,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Dasbor',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Tamu',
        ),
        BottomNavigationBarItem(
          icon: _ScanButton(),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_rounded),
          label: 'RSVP',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Pengaturan',
        ),
      ],
    );
  }
}

class _ScanButton extends StatelessWidget {
  const _ScanButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: AppConstants.primaryColor,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.qr_code_scanner,
        color: Colors.white,
      ),
    );
  }
}