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
        Guest(
          id: '1',
          name: 'Moch Nizwar Syafuan',
          checkInDate: now,
          isCheckedIn: true,
          isVip: true,
        ),
        Guest(
          id: '2',
          name: 'Alfi Firdaus',
          checkInDate: now,
          isCheckedIn: true,
        ),
        Guest(
          id: '3',
          name: 'Moch Nizwar Syafuan',
          checkInDate: now,
          isCheckedIn: true,
          isVip: true,
        ),
        Guest(
          id: '4',
          name: 'Alfi Firdaus',
          checkInDate: now,
          isCheckedIn: true,
        ),
      ]);
    });
  }

  Future<void> _handleExport() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data berhasil diexport ke Excel'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal export: ${e.toString()}'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true, // Allow pop on Dashboard to exit app
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 310,
              floating: false,
              pinned: true,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: 255,
                      child: Container(
                        color: AppConstants.primaryColor,
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.defaultPadding,
                          vertical: AppConstants.defaultPadding / 2,
                        ),
                        child: Column(
                          children: [
                            const HeaderWidget(subtitle: 'Dasbor'),
                            const SizedBox(height: 16),
                            EventCard(
                              username: 'alfifirdaus0607',
                              eventName: 'Ina Amalia & Alfi Firdaus',
                              eventDate: DateTime(2023, 6, 26),
                              totalGuests: _guests.length,
                              onExport: _handleExport,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.defaultPadding,
                    vertical: AppConstants.defaultPadding / 2,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildExportSection(),
                      const SizedBox(height: 16),
                      _buildSearchField(),
                      const SizedBox(height: 16),
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
            style: TextStyle(
              color: AppConstants.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          'TOTAL TAMU Check In: ${_guests.length}',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
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
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
      onChanged: (value) {
        // TODO: Implement search functionality
      },
    );
  }

  Widget _buildGuestListHeader() {
    return const Text(
      'Daftar Tamu',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (guest.isVip)
                Positioned(right: 4, bottom: 4, child: _buildVipBadge()),
            ],
          ),
        ),
        title: Text(guest.name),
        subtitle: Text(guest.formattedCheckInDate),
        trailing: _buildCheckInStatus(guest),
      ),
    );
  }

  Widget _buildVipBadge() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        color: AppConstants.vipColor,
        shape: BoxShape.circle,
      ),
      child: const Text(
        'VIP',
        style: TextStyle(color: AppConstants.blackColor, fontSize: 10),
      ),
    );
  }

  Widget _buildCheckInStatus(Guest guest) {
    if (!guest.isCheckedIn) {
      return const Text('Pending', style: TextStyle(color: Colors.grey));
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppConstants.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        'Checked In',
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}