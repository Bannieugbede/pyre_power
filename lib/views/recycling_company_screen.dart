import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RecyclingCompanyScreen extends StatelessWidget {
  RecyclingCompanyScreen({super.key});

  final List<Map<String, String>> requests = [
    {
      'id': '1',
      'user': 'Jane Smith',
      'type': 'Recycling',
      'description': 'PET Bottles',
      'location': '789 Recycle Ave, Lagos',
      'date': '2025-07-26',
    },
    {
      'id': '2',
      'user': 'Green Ltd',
      'type': 'Recycling',
      'description': 'Cardboard',
      'location': '101 Eco Lane, Ibadan',
      'date': '2025-07-27',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recycling Company Hub'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Manage Recycling Requests',
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
                      leading: Icon(Iconsax.trash, color: Color(0xFF2E7D32)),
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