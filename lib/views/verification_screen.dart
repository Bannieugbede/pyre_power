import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../controllers/user_provider.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Your Identity'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Complete Verification',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            const Text(
              'Please complete face and document verification to activate your account.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            _buildVerificationCard(
              context,
              title: 'Face Verification',
              icon: Iconsax.camera,
              onTap: () => _verifyFace(context, userProvider),
            ),
            const SizedBox(height: 16),
            _buildVerificationCard(
              context,
              title: 'Document Verification',
              icon: Iconsax.document,
              onTap: () => _verifyDocument(context, userProvider),
            ),
            const SizedBox(height: 24),
            if (userProvider.isVerified)
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/dashboard');
                },
                child: const Text('Proceed to Dashboard'),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildVerificationCard(BuildContext context, {required String title, required IconData icon, required VoidCallback onTap}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 30, color: const Color(0xFF2E7D32)),
              const SizedBox(width: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF2E7D32),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _verifyFace(BuildContext context, UserProvider userProvider) {
    // Mock face verification
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Face Verification'),
        content: const Text('Simulating face verification... (In real app, use FaceIO or similar API)'),
        actions: [
          TextButton(
            onPressed: () {
              userProvider.verifyUser(); // Mark as verified
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Face verification successful')),
              );
            },
            child: const Text('Complete'),
          ),
        ],
      ),
    );
  }

  void _verifyDocument(BuildContext context, UserProvider userProvider) {
    // Mock document verification
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Document Verification'),
        content: const Text('Simulating document upload... (In real app, use ID verification API)'),
        actions: [
          TextButton(
            onPressed: () {
              userProvider.verifyUser(); // Mark as verified
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Document verification successful')),
              );
            },
            child: const Text('Complete'),
          ),
        ],
      ),
    );
  }
}