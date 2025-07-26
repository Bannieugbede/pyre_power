import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../widget_files/custom_button.dart';
import '../widget_files/custom_text_field.dart';

class SchedulePickupScreen extends StatelessWidget {
  const SchedulePickupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Schedule Pickup')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Schedule a Waste Pickup', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Waste Type',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Iconsax.receive_square),
                ),
                items: ['Plastic', 'Paper', 'Organic', 'E-Waste'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Pickup Date',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Iconsax.calendar),
                ),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2026),
                  );
                },
              ),
              const SizedBox(height: 16),
              const CustomTextField(hintText: 'Address', icon: Iconsax.location),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Schedule Pickup',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pickup Scheduled! Earned 10 points.')),
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