import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_constants.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/header_widget.dart';
import 'dashboard_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
        backgroundColor: AppConstants.backgroundColor,
        body: Column(
          children: [
            const HeaderWidget(subtitle: 'Pengaturan'),
            Container(
              color: AppConstants.backgroundColor,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nama Event',
                          style: AppConstants.bodyStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppConstants.neutralColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Ina Amalia & Alfi Firdaus',
                          style: AppConstants.bodyStyle,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit, color: AppConstants.neutralColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              color: AppConstants.backgroundColor,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pesan Undangan',
                          style: AppConstants.bodyStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppConstants.neutralColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '*Kepada Yth : ...',
                          style: AppConstants.bodyStyle,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit, color: AppConstants.neutralColor),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.defaultPadding,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildImageCard(
                            imageAssetPath: 'assets/gambar.jpg',
                            label: 'Layar Background',
                          ),
                          _buildImageCard(
                            imageAssetPath: 'assets/gambar.jpg',
                            label: 'Layar Sapa',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      color: AppConstants.backgroundColor,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Akses untuk Layar Sapa',
                                  style: AppConstants.bodyStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppConstants.neutralColor,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Tap Untuk Menyalin Link Layar Sapa',
                                  style: AppConstants.bodyStyle,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Clipboard.setData(const ClipboardData(text: 'https://example.com')).then((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Link telah disalin', style: AppConstants.bodyStyle),
                                    duration: const Duration(seconds: 1),
                                  ),
                                );
                              });
                            },
                            icon: Icon(Icons.copy, color: AppConstants.neutralColor),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      color: AppConstants.backgroundColor,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Logout',
                                  style: AppConstants.bodyStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppConstants.neutralColor,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Keluar Dari Akun Ini',
                                  style: AppConstants.bodyStyle,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: AppConstants.backgroundColor,
                                  title: Text(
                                    'Konfirmasi Logout',
                                    style: AppConstants.subtitleStyle.copyWith(
                                      color: AppConstants.accentColor,
                                    ),
                                  ),
                                  content: Text(
                                    'Apakah Anda yakin ingin logout?',
                                    style: AppConstants.bodyStyle.copyWith(
                                      color: AppConstants.accentColor,
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppConstants.backgroundColor,
                                        foregroundColor: AppConstants.neutralColor,
                                        side: BorderSide(color: AppConstants.primaryColor),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Tidak', style: AppConstants.bodyStyle),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppConstants.warningColor,
                                        foregroundColor: AppConstants.backgroundColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.pushReplacementNamed(context, '/login');
                                      },
                                      child: Text('Ya', style: AppConstants.bodyStyle),
                                    ),
                                  ],
                                ),
                              );
                            },
                            icon: Icon(Icons.logout, color: AppConstants.neutralColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigation(
          selectedIndex: 4,
          parentContext: context,
        ),
      ),
    );
  }

  Widget _buildImageCard({
    required String imageAssetPath,
    required String label,
  }) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Card(
              margin: EdgeInsets.zero,
              elevation: 1,
              child: Image.asset(
                imageAssetPath,
                width: 185,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              child: CircleAvatar(
                backgroundColor: AppConstants.primaryColor,
                radius: 20,
                child: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.white),
                  onPressed: () {
                  },
                ),
              ),
            ),
          ],
        ),
        Container(
          width: 185,
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: AppConstants.primaryColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: AppConstants.bodyStyle.copyWith(
                color: AppConstants.backgroundColor,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}