import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../widget_files/custom_button.dart';
import '../widget_files/custom_text_field.dart';

class UserHubScreen extends StatelessWidget {
  const UserHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Hub'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Request Waste Management Services',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Service Type',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Iconsax.activity, color: Color(0xFF2E7D32)),
                ),
                items: ['Waste Pickup', 'Recycling', 'Waste-to-Energy'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              const CustomTextField(hintText: 'Waste Description (e.g., Plastic, Organic)', icon: Iconsax.trash),
              const SizedBox(height: 16),
              const CustomTextField(hintText: 'Location (e.g., 123 Eco Street, Lagos)', icon: Iconsax.location),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Preferred Date',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Iconsax.calendar, color: Color(0xFF2E7D32)),
                ),
                onTap: () async {
                  await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2026),
                  );
                },
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Submit Request',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Request Submitted!')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}