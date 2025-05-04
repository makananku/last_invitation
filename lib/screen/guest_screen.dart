import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/header_widget.dart';
import 'dashboard_screen.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({super.key});

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
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
            const HeaderWidget(subtitle: 'Tamu'),
            Container(
              color: const Color(0xFFF6F6F6),
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: AppConstants.backgroundColor,
                        border: Border.all(color: AppConstants.primaryColor),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Tamu Mempelai Pria | 3',
                        style: AppConstants.bodyStyle.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: AppConstants.primaryColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Tamu Mempelai Wanita | 10',
                        style: AppConstants.bodyStyle.copyWith(
                          color: AppConstants.backgroundColor,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding,
                vertical: AppConstants.defaultPadding / 2,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari Tamu...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onChanged: (value) {
                },
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildGuestCard(
                    number: 1,
                    name: 'Alfi Firdaus',
                    location: 'Tasikmalaya',
                    hasCheckmark: false,
                    hasWhatsapp: true,
                  ),
                  _buildGuestCard(
                    number: 2,
                    name: 'Nizwar Syafuan',
                    location: 'Kalimantan',
                    hasCheckmark: true,
                    hasWhatsapp: false,
                  ),
                  _buildGuestCard(
                    number: 3,
                    name: 'Ari Sawali',
                    location: 'Bandung',
                    hasCheckmark: false,
                    hasWhatsapp: true,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding,
                vertical: AppConstants.defaultPadding,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppConstants.primaryColor,
                  borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.contacts, color: AppConstants.backgroundColor),
                              const SizedBox(width: 8),
                              Text(
                                'Tambah Dari Kontak',
                                style: AppConstants.bodyStyle.copyWith(color: AppConstants.backgroundColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 2,
                      height: 30,
                      color: AppConstants.backgroundColor.withOpacity(0.6),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Tambah Manual',
                                style: AppConstants.bodyStyle.copyWith(color: AppConstants.backgroundColor),
                              ),
                              const SizedBox(width: 8),
                              Icon(Icons.badge, color: AppConstants.backgroundColor),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigation(
          selectedIndex: 1,
          parentContext: context,
        ),
      ),
    );
  }

  Widget _buildGuestCard({
    required int number,
    required String name,
    required String location,
    required bool hasCheckmark,
    required bool hasWhatsapp,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: 6,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.cardRadius)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppConstants.primaryColor,
              child: Text(
                '$number',
                style: AppConstants.bodyStyle.copyWith(
                  color: AppConstants.backgroundColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppConstants.bodyStyle.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    location,
                    style: AppConstants.bodyStyle.copyWith(color: AppConstants.neutralColor),
                  ),
                ],
              ),
            ),
            if (hasCheckmark)
              Icon(
                Icons.check,
                color: AppConstants.primaryColor,
                size: 24,
              ),
            if (hasWhatsapp)
              IconButton(
                icon: Image.asset('assets/wa.png', width: 24, height: 24),
                onPressed: () {},
              ),
            IconButton(
              icon: Icon(Icons.delete, color: AppConstants.warningColor),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}