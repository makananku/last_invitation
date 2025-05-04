import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class HeaderWidget extends StatelessWidget {
  final String subtitle;

  const HeaderWidget({
    super.key,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConstants.primaryColor,
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: AppConstants.defaultPadding / 2,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/logo.jpg',
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 8),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Last',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: AppConstants.headerFontSize,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: 'invitation',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: AppConstants.headerFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38), // Align with logo
              child: Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}