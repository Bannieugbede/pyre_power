import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class GuidelinesScreen extends StatelessWidget {
  GuidelinesScreen({super.key});

  final List<Map<String, String>> guidelines = [
    {
      'title': 'Plastic Waste',
      'description': 'Rinse plastic containers and separate from other waste. Avoid mixing with organic waste.',
    },
    {
      'title': 'Paper Waste',
      'description': 'Flatten cardboard and remove any tape or staples. Keep dry for recycling.',
    },
    {
      'title': 'Organic Waste',
      'description': 'Compost food scraps and garden waste. Do not include plastic or metal.',
    },
    {
      'title': 'E-Waste',
      'description': 'Dispose of electronics at designated centers. Do not place in regular bins.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Disposal Guidelines')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: ListView.builder(
          itemCount: guidelines.length,
          itemBuilder: (context, index) {
            final guideline = guidelines[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                leading: const Icon(Iconsax.info_circle, color: Color(0xFF2E7D32)),
                title: Text(guideline['title']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                subtitle: Text(guideline['description']!, style: const TextStyle(fontSize: 14)),
              ),
            );
          },
        ),
      ),
    );
  }
}