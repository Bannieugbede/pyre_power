import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../widget_files/custom_button.dart';
import '../widget_files/custom_text_field.dart';
import 'signup_screen.dart'; // Ensure this import path is correct
import 'dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Iconsax.receive_square,
                    size: 60, color: Color(0xFF2E7D32)),
                const SizedBox(height: 16),
                const Text(
                  'Pyre-EcoMint',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E7D32)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                const CustomTextField(hintText: 'Email', icon: Iconsax.sms),
                const SizedBox(height: 16),
                const CustomTextField(
                    hintText: 'Password', icon: Iconsax.lock, isPassword: true),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'Login',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardScreen()),
                    );
                  },
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupScreen()),
                    );
                  },
                  child: const Text(
                    'Don’t have an account? Sign Up',
                    style: TextStyle(color: Color(0xFF2E7D32)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
