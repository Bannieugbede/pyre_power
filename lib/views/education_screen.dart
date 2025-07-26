import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EducationScreen extends StatelessWidget {
  EducationScreen({super.key});

  final List<Map<String, String>> resources = [
    {
      'title': 'Reduce Waste',
      'description': 'Learn how to minimize waste by reusing items and reducing single-use plastics.',
    },
    {
      'title': 'Recycling Tips',
      'description': 'Sort recyclables correctly and check local recycling rules.',
    },
    {
      'title': 'Composting Guide',
      'description': 'Turn organic waste into compost for your garden.',
    },
    {
      'title': 'E-Waste Safety',
      'description': 'Handle electronics safely to avoid hazardous material leaks.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Education & Resources')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: ListView.builder(
          itemCount: resources.length,
          itemBuilder: (context, index) {
            final resource = resources[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                leading: const Icon(Iconsax.teacher, color: Color(0xFF2E7D32)),
                title: Text(resource['title']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                subtitle: Text(resource['description']!, style: const TextStyle(fontSize: 14)),
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}