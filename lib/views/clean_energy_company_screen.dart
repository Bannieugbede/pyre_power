import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CleanEnergyCompanyScreen extends StatelessWidget {
  CleanEnergyCompanyScreen({super.key});

  final List<Map<String, String>> requests = [
    {
      'id': '1',
      'user': 'Eco Corp',
      'type': 'Waste-to-Energy',
      'description': 'Organic Waste',
      'location': '123 Green Road, Abuja',
      'date': '2025-07-26',
    },
    {
      'id': '2',
      'user': 'John Doe',
      'type': 'Waste-to-Energy',
      'description': 'Biomass',
      'location': '456 Eco Street, Lagos',
      'date': '2025-07-27',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clean Energy Company Hub'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Manage Waste-to-Energy Requests',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: requests.length,
                itemBuilder: (context, index) {
                  final request = requests[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: const Icon(Iconsax.battery_charging, color: Color(0xFF2E7D32)),
                      title: Text('${request['type']} - ${request['user']}'),
                      subtitle: Text('${request['description']} at ${request['location']}'),
                      trailing: Text(request['date']!),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Accepted Request #${request['id']}')),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}