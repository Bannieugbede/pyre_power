import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../widget_files/custom_button.dart';
import '../widget_files/custom_text_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Profile'),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFF2E7D32),
                child: Icon(Iconsax.user, size: 50, color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text('User Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              const CustomTextField(
                hintText: 'Full Name',
                icon: Iconsax.user,
                initialText: 'Barnabas Ejeh', // Changed from initialValue to initialText
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                hintText: 'Email',
                icon: Iconsax.sms,
                initialText: 'barnabas.ejeh@example.com', // Changed from initialValue to initialText
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                hintText: 'Phone Number',
                icon: Iconsax.call,
                initialText: '+234 123 456 7890', // Changed from initialValue to initialText
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                hintText: 'Address',
                icon: Iconsax.location,
                initialText: '123 Eco Street, Lagos', // Changed from initialValue to initialText
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Save Changes',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Profile Updated!')),
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