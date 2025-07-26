import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../models/pickup_model.dart';

class PickupTrackingScreen extends StatelessWidget {
  PickupTrackingScreen({super.key});

  final List<Pickup> pickups = [
    Pickup(
      id: '1',
      wasteType: 'Plastic',
      date: '2025-07-25',
      address: '123 Eco Street, Lagos',
      status: 'Pending',
    ),
    Pickup(
      id: '2',
      wasteType: 'Paper',
      date: '2025-07-20',
      address: '456 Green Avenue, Lagos',
      status: 'In Progress',
      driverName: 'Chukwuma Obi',
      driverPhone: '+234 987 654 3210',
      estimatedArrival: '12:30 PM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pickup Tracking')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: ListView.builder(
          itemCount: pickups.length,
          itemBuilder: (context, index) {
            final pickup = pickups[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pickup #${pickup.id}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    Text('Waste Type: ${pickup.wasteType}'),
                    Text('Date: ${pickup.date}'),
                    Text('Address: ${pickup.address}'),
                    Text('Status: ${pickup.status}', style: TextStyle(color: pickup.status == 'Pending' ? Colors.orange : Colors.green)),
                    if (pickup.status != 'Pending') ...[
                      const SizedBox(height: 8),
                      Text('Driver: ${pickup.driverName}'),
                      Text('Contact: ${pickup.driverPhone}'),
                      Text('ETA: ${pickup.estimatedArrival}'),
                    ],
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('View Details', style: TextStyle(color: Color(0xFF2E7D32))),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}