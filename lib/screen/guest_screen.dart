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
        // Navigate to DashboardScreen instead of popping
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
                        color: Colors.white,
                        border: Border.all(color: AppConstants.primaryColor),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Center(
                        child: Text(
                          'Tamu Mempelai Pria | 3',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                      child: const Center(
                        child: Text(
                          'Tamu Mempelai Wanita | 10',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onChanged: (value) {
                  // TODO: Implement search functionality
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
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // TODO: Tambah Dari Kontak
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.contacts, color: Colors.white),
                              const SizedBox(width: 8),
                              const Text(
                                'Tambah Dari Kontak',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 2,
                      height: 30,
                      color: Colors.white.withOpacity(0.6),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // TODO: Tambah Manual
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Tambah Manual',
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.badge, color: Colors.white),
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppConstants.primaryColor,
              child: Text(
                '$number',
                style: const TextStyle(
                  color: Colors.white,
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
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(location, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            if (hasCheckmark)
              const Icon(
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
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}