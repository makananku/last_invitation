import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class EventCard extends StatelessWidget {
  final String username;
  final String eventName;
  final DateTime eventDate;
  final int totalGuests;
  final VoidCallback? onExport;

  const EventCard({
    super.key,
    required this.username,
    required this.eventName,
    required this.eventDate,
    required this.totalGuests,
    this.onExport,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.cardRadius),
        side: BorderSide(color: AppConstants.primaryColor, width: 1.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserInfo(),
            Divider(
              color: AppConstants.primaryColor,
              thickness: 1.0,
              indent: 30,
              endIndent: 30,
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            _buildEventInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: AppConstants.primaryColor,
          child: Text(
            username.isNotEmpty ? username[0].toUpperCase() : '?',
            style: AppConstants.bodyStyle.copyWith(
              color: AppConstants.backgroundColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          username,
          style: AppConstants.bodyStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildEventInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nama Event',
          style: AppConstants.bodyStyle.copyWith(color: AppConstants.neutralColor),
        ),
        Text(
          eventName,
          style: AppConstants.bodyStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Waktu Event',
          style: AppConstants.bodyStyle.copyWith(color: AppConstants.neutralColor),
        ),
        Text(
          '${eventDate.day} ${_getMonthName(eventDate.month)} ${eventDate.year}',
          style: AppConstants.bodyStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  String _getMonthName(int month) {
    const months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];
    return months[month - 1];
  }
}