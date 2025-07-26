class Pickup {
  final String id;
  final String wasteType;
  final String date;
  final String address;
  final String status; // e.g., 'Pending', 'In Progress', 'Completed'
  final String? driverName;
  final String? driverPhone;
  final String? estimatedArrival;

  Pickup({
    required this.id,
    required this.wasteType,
    required this.date,
    required this.address,
    required this.status,
    this.driverName,
    this.driverPhone,
    this.estimatedArrival,
  });
}