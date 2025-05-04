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
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Ina Amalia & Alfi Firdaus',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit, color: Colors.grey),
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
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '*Kepada Yth : ...',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit, color: Colors.grey),
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
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Tap Untuk Menyalin Link Layar Sapa',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Clipboard.setData(
                                const ClipboardData(
                                  text: 'https://example.com',
                                ),
                              ).then((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Link telah disalin'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              });
                            },
                            icon: const Icon(Icons.copy, color: Colors.grey),
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
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Keluar Dari Akun Ini',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder:
                                    (context) => AlertDialog(
                                      backgroundColor:
                                          AppConstants.backgroundColor,
                                      title: Text(
                                        'Konfirmasi Logout',
                                        style: TextStyle(
                                          color: AppConstants.accentColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      content: Text(
                                        'Apakah Anda yakin ingin logout?',
                                        style: TextStyle(
                                          color: AppConstants.accentColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppConstants.backgroundColor,
                                            foregroundColor:
                                                AppConstants.neutralColor,
                                            side: BorderSide(
                                              color: AppConstants.primaryColor,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Tidak'),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppConstants.warningColor,
                                            foregroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            Navigator.pushReplacementNamed(
                                              context,
                                              '/logout',
                                            );
                                          },
                                          child: const Text('Ya'),
                                        ),
                                      ],
                                    ),
                              );
                            },
                            icon: const Icon(Icons.logout, color: Colors.grey),
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
        Container(
          width: 185, // Same width as the image
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: const BoxDecoration(
            color: AppConstants.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
              topLeft: Radius.zero,
              topRight: Radius.zero,
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
