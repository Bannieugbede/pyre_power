import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../models/notification_model.dart' as nm; // Alias for custom Notification model

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final List<nm.Notification> notifications = [
    nm.Notification(
      id: '1',
      title: 'Pickup Scheduled',
      message: 'Your plastic waste pickup is scheduled for 2025-07-25.',
      date: '2025-07-24',
    ),
    nm.Notification(
      id: '2',
      title: 'Bill Due',
      message: 'Your PHCN bill of ₦3,500 is due on 2025-07-28.',
      date: '2025-07-23',
    ),
    nm.Notification(
      id: '3',
      title: 'Special Collection Event',
      message: 'Join our E-Waste collection drive on 2025-08-01!',
      date: '2025-07-22',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                leading: const Icon(Iconsax.notification, color: Color(0xFF2E7D32)),
                title: Text(
                  notification.title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(notification.message),
                trailing: Text(
                  notification.date,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}