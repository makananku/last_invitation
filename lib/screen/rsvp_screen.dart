import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/header_widget.dart';
import 'dashboard_screen.dart';

class RSVPScreen extends StatefulWidget {
  const RSVPScreen({super.key});

  @override
  State<RSVPScreen> createState() => _RSVPScreenState();
}

class _RSVPScreenState extends State<RSVPScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(),
            settings: const RouteSettings(name: '/dashboard'),
          ),
        );
      },
      child: Scaffold(
        body: Column(
          children: [
            const HeaderWidget(subtitle: 'RSVP & Ucapan'),
            Container(
              color: const Color(0xFFF6F6F6),
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  _buildStatCard('4', 'Hadir', Colors.green.shade200),
                  const SizedBox(width: 4),
                  _buildStatCard('2', 'Masih Ragu', Colors.yellow.shade600),
                  const SizedBox(width: 4),
                  _buildStatCard('1', 'Tidak Hadir', Colors.red.shade200),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: [
                  _buildRSVPCard('A', 'Alfi Firdaus', 'Yo Halo Pipel', 'Hadir'),
                  _buildRSVPCard('A', 'Agung Purnama', 'Semoga Samawa', 'Hadir'),
                  _buildRSVPCard('M', 'Moch Nizwar Syafuan', 'Yahaha si Babi Kawin', 'Masih Ragu'),
                  _buildRSVPCard('I', 'Iman Firmansyah', 'Gak Bisa Datang Bro', 'Tidak Hadir'),
                  _buildRSVPCard('A', 'Alfi Firdaus', 'Yo Halo Pipel', 'Hadir'),
                  _buildRSVPCard('A', 'Agung Purnama', 'Semoga Samawa', 'Hadir'),
                  _buildRSVPCard('M', 'Moch Nizwar Syafuan', 'Yahaha si Babi Kawin', 'Masih Ragu'),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigation(
          selectedIndex: 3,
          parentContext: context,
        ),
      ),
    );
  }

  Widget _buildStatCard(String count, String label, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Text(
              count,
              style: AppConstants.bodyStyle.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(label, style: AppConstants.bodyStyle),
          ],
        ),
      ),
    );
  }

  Widget _buildRSVPCard(String initial, String name, String message, String status) {
    Color statusColor;
    switch (status) {
      case 'Hadir':
        statusColor = Colors.green;
        break;
      case 'Masih Ragu':
        statusColor = Colors.orange;
        break;
      case 'Tidak Hadir':
        statusColor = Colors.red;
        break;
      default:
        statusColor = AppConstants.neutralColor;
    }

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: 6,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.cardRadius)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppConstants.primaryColor,
              child: Text(
                initial,
                style: AppConstants.bodyStyle.copyWith(color: AppConstants.backgroundColor),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppConstants.bodyStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message,
                    style: AppConstants.bodyStyle.copyWith(color: AppConstants.neutralColor),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.15),
                border: Border.all(color: statusColor),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                status,
                style: AppConstants.bodyStyle.copyWith(
                  color: statusColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}