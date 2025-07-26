import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../widget_files/custom_button.dart';
import '../widget_files/custom_text_field.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feedback & Support')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Submit Feedback', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              const SizedBox(height: 16),
              const CustomTextField(hintText: 'Subject', icon: Iconsax.message),
              const SizedBox(height: 16),
              TextFormField(
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Message',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Iconsax.text),
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Submit Feedback',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Feedback Submitted!')),
                  );
                },
              ),
              const SizedBox(height: 24),
              const Text('Contact Support', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Iconsax.call, color: Color(0xFF2E7D32)),
                title: const Text('Phone'),
                subtitle: const Text('+234 123 456 7890'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Iconsax.sms, color: Color(0xFF2E7D32)),
                title: const Text('Email'),
                subtitle: const Text('support@pyrepower.ng'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}