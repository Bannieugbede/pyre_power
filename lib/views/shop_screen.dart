import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widget_files/custom_button.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({super.key});

  final List<Product> products = [
    Product(id: '1', name: 'Eco Bag', description: 'Reusable eco-friendly bag', points: 50, imageUrl: ''),
    Product(id: '2', name: 'Water Bottle', description: 'Stainless steel bottle', points: 80, imageUrl: ''),
    Product(id: '3', name: 'Gift Card', description: 'Eco store gift card', points: 150, imageUrl: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Eco Shop')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Eco-Friendly Products', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          color: Colors.grey[300], // Placeholder for image
                          child: const Center(child: Icon(Icons.image, size: 50)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text(product.description, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                              const SizedBox(height: 8),
                              Text('${product.points} points', style: const TextStyle(color: Colors.green)),
                              const SizedBox(height: 8),
                              CustomButton(
                                text: 'Buy Now',
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Purchased ${product.name}!')),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}