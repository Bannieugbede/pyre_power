import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../widget_files/custom_button.dart';
import '../widget_files/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Account Type',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Iconsax.user, color: Color(0xFF2E7D32)),
                ),
                items: [
                  'Individual User',
                  'Company User',
                  'Waste Disposal Company',
                  'Recycling Company',
                  'Clean Energy Company',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              const CustomTextField(hintText: 'Full Name / Company Name', icon: Iconsax.user),
              const SizedBox(height: 16),
              const CustomTextField(hintText: 'Email', icon: Iconsax.sms),
              const SizedBox(height: 16),
              const CustomTextField(hintText: 'Phone Number', icon: Iconsax.call),
              const SizedBox(height: 16),
              const CustomTextField(hintText: 'Address', icon: Iconsax.location),
              const SizedBox(height: 16),
              const CustomTextField(hintText: 'Password', icon: Iconsax.lock, isPassword: true),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Sign Up',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}