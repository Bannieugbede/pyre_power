import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TrashClassificationScreen extends StatelessWidget {
  const TrashClassificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trash Classifier'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Classify Your Trash',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            const Text(
              'Upload an image or describe an item to check if it’s recyclable.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            _buildClassificationOption(
              context,
              title: 'Upload Image',
              icon: Iconsax.image,
              onTap: () => _classifyTrash(context, 'image'),
            ),
            const SizedBox(height: 16),
            _buildClassificationOption(
              context,
              title: 'Describe Item',
              icon: Iconsax.text,
              onTap: () => _classifyTrash(context, 'text'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClassificationOption(BuildContext context, {required String title, required IconData icon, required VoidCallback onTap}) {
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

  Future<void> _classifyTrash(BuildContext context, String method) async {
    if (method == 'image') {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        // Mock classification with tflite_flutter (real model would be loaded here)
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Trash Classification (Image)'),
            content: const Text('Item classified as: Recyclable\n(In real app, use tflite_flutter model)'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } else {
      // Mock text-based classification
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Trash Classification (Text)'),
          content: const Text('Item classified as: Recyclable\n(In real app, use tflite_flutter model)'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}