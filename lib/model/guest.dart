class Guest {
  final String id;
  final String name;
  final DateTime checkInDate;
  final bool isCheckedIn;
  final bool isVip;

  Guest({
    required this.id,
    required this.name,
    required this.checkInDate,
    this.isCheckedIn = false,
    this.isVip = false,
  });

  String get formattedCheckInDate {
    return '${checkInDate.day}/${checkInDate.month}/${checkInDate.year} ${checkInDate.hour}:${checkInDate.minute.toString().padLeft(2, '0')}';
  }

  String get initial => name.isNotEmpty ? name[0].toUpperCase() : '?';
}