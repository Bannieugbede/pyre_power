import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../controllers/user_provider.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription Plans'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose a Plan',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            _buildPlanCard(
              context,
              title: 'Weekly Plan',
              price: '₦500 / week',
              description: 'Access all features for 7 days',
              onTap: () => _subscribe(context, userProvider, 'Weekly'),
            ),
            const SizedBox(height: 16),
            _buildPlanCard(
              context,
              title: 'Monthly Plan',
              price: '₦1,800 / month',
              description: 'Access all features for 30 days',
              onTap: () => _subscribe(context, userProvider, 'Monthly'),
            ),
            const SizedBox(height: 24),
            Text(
              'Current Plan: ${userProvider.subscriptionPlan == 'None' ? 'None' : userProvider.subscriptionPlan}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (userProvider.subscriptionExpiry != null)
              Text(
                'Expires: ${userProvider.subscriptionExpiry!.toString().split(' ')[0]}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard(BuildContext context, {required String title, required String price, required String description, required VoidCallback onTap}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: const Color(0xFF2E7D32),
                    ),
                  ),
                  const Icon(Iconsax.ticket, color: Color(0xFF2E7D32)),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                price,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _subscribe(BuildContext context, UserProvider userProvider, String plan) {
    userProvider.subscribe(plan);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Subscribed to $plan plan')),
    );
    Navigator.pop(context);
  }
}