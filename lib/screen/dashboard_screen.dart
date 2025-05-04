import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../model/guest.dart';
import '../widgets/event_card.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/header_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Guest> _guests = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadDummyData();
  }

  void _loadDummyData() {
    final now = DateTime.now();
    setState(() {
      _guests.addAll([
        Guest(id: '1', name: 'Moch Nizwar Syafuan', checkInDate: now, isCheckedIn: true, isVip: true),
        Guest(id: '2', name: 'Alfi Firdaus', checkInDate: now, isCheckedIn: true),
        Guest(id: '3', name: 'Moch Nizwar Syafuan', checkInDate: now, isCheckedIn: true, isVip: true),
        Guest(id: '4', name: 'Alfi Firdaus', checkInDate: now, isCheckedIn: true),
      ]);
    });
  }

  Future<void> _handleExport() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data berhasil diexport ke Excel', style: AppConstants.bodyStyle),
          duration: const Duration(seconds: 2),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal export: ${e.toString()}', style: AppConstants.bodyStyle),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        backgroundColor: AppConstants.backgroundColor,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Container(
                    height: 255,
                    color: AppConstants.primaryColor,
                  ),
                  Column(
                    children: [
                      const HeaderWidget(subtitle: 'Dasbor'),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.defaultPadding,
                          vertical: AppConstants.defaultPadding / 2,
                        ),
                        child: EventCard(
                          username: 'alfifirdaus0607',
                          eventName: 'Ina Amalia & Alfi Firdaus',
                          eventDate: DateTime(2023, 6, 26),
                          totalGuests: _guests.length,
                          onExport: _handleExport,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: AppConstants.backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding,
                    vertical: AppConstants.defaultPadding / 2,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildExportSection(),
                      const SizedBox(height: AppConstants.defaultPadding),
                      _buildSearchField(),
                      const SizedBox(height: AppConstants.defaultPadding),
                      _buildGuestListHeader(),
                      const SizedBox(height: 8),
                      _buildGuestList(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigation(
          selectedIndex: 0,
          parentContext: context,
        ),
      ),
    );
  }

  Widget _buildExportSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: _handleExport,
          child: Text(
            'Export to Excel',
            style: AppConstants.bodyStyle.copyWith(
              color: AppConstants.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          'TOTAL TAMU Check In: ${_guests.length}',
          style: AppConstants.bodyStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Cari tamu...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
      onChanged: (value) {
      },
    );
  }

  Widget _buildGuestListHeader() {
    return Text(
      'Daftar Tamu',
      style: AppConstants.subtitleStyle,
    );
  }

  Widget _buildGuestList() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.builder(
        itemCount: _guests.length,
        itemBuilder: (context, index) {
          final guest = _guests[index];
          return _buildGuestCard(guest);
        },
      ),
    );
  }

  Widget _buildGuestCard(Guest guest) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.cardRadius)),
      child: ListTile(
        leading: SizedBox(
          width: 50,
          height: 50,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                backgroundColor: AppConstants.primaryColor,
                child: Text(
                  guest.initial,
                  style: AppConstants.bodyStyle.copyWith(
                    color: AppConstants.backgroundColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (guest.isVip) Positioned(right: 4, bottom: 4, child: _buildVipBadge()),
            ],
          ),
        ),
        title: Text(guest.name, style: AppConstants.bodyStyle.copyWith(fontWeight: FontWeight.w600)),
        subtitle: Text(guest.formattedCheckInDate, style: AppConstants.bodyStyle),
        trailing: _buildCheckInStatus(guest),
      ),
    );
  }

  Widget _buildVipBadge() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppConstants.vipColor,
        shape: BoxShape.circle,
      ),
      child: Text(
        'VIP',
        style: AppConstants.bodyStyle.copyWith(
          color: AppConstants.blackColor,
          fontSize: 10,
        ),
      ),
    );
  }

  Widget _buildCheckInStatus(Guest guest) {
    if (!guest.isCheckedIn) {
      return Text(
        'Pending',
        style: AppConstants.bodyStyle.copyWith(color: AppConstants.neutralColor),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppConstants.primaryColor,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: Text(
        'Checked In',
        style: AppConstants.bodyStyle.copyWith(
          color: AppConstants.backgroundColor,
          fontSize: 12,
        ),
      ),
    );
  }
}