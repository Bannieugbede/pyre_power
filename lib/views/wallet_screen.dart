import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../controllers/user_provider.dart';
import 'subscription_screen.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Wallet Balance',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₦${userProvider.walletBalance.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: const Color(0xFF2E7D32),
                        ),
                      ),
                      const Icon(Iconsax.wallet, size: 40, color: Color(0xFF2E7D32)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Fund Wallet',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              _buildFundingOption(
                context,
                title: 'Debit Card',
                icon: Iconsax.card,
                onTap: () => _fundWallet(context, userProvider, 'Debit Card'),
              ),
              const SizedBox(height: 8),
              _buildFundingOption(
                context,
                title: 'Bank Transfer',
                icon: Iconsax.bank,
                onTap: () => _fundWallet(context, userProvider, 'Bank Transfer'),
              ),
              const SizedBox(height: 24),
              Text(
                'Redeem Points (${userProvider.ecoPoints} points)',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              _buildFundingOption(
                context,
                title: 'Data (1GB, 50 points)',
                icon: Iconsax.mobile,
                onTap: () => _redeemPoints(context, userProvider, '1GB Data', 50),
              ),
              const SizedBox(height: 8),
              _buildFundingOption(
                context,
                title: 'Airtime (₦500, 30 points)',
                icon: Iconsax.call,
                onTap: () => _redeemPoints(context, userProvider, '₦500 Airtime', 30),
              ),
              const SizedBox(height: 8),
              _buildFundingOption(
                context,
                title: 'Utility Bill (₦1,000, 60 points)',
                icon: Iconsax.electricity,
                onTap: () => _redeemPoints(context, userProvider, '₦1,000 Utility Bill', 60),
              ),
              const SizedBox(height: 24),
              Text(
                'Subscription Status',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  title: Text(userProvider.subscriptionPlan == 'None'
                      ? 'No Active Subscription'
                      : '${userProvider.subscriptionPlan} Plan'),
                  subtitle: Text(userProvider.subscriptionPlan == 'None'
                      ? 'Subscribe to access premium features'
                      : 'Expires: ${userProvider.subscriptionExpiry?.toString().split(' ')[0] ?? ''}'),
                  trailing: const Icon(Iconsax.ticket, color: Color(0xFF2E7D32)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SubscriptionScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      )

    );
  }

  Widget _buildFundingOption(BuildContext context, {required String title, required IconData icon, required VoidCallback onTap}) {
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

  void _fundWallet(BuildContext context, UserProvider userProvider, String method) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Fund Wallet with $method'),
        content: const Text('Enter amount (₦):'),
        actions: [
          TextField(
            keyboardType: TextInputType.number,
            onSubmitted: (value) {
              final amount = double.tryParse(value) ?? 0.0;
              if (amount > 0) {
                userProvider.fundWallet(amount);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('₦$amount added via $method')),
                );
              }
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'e.g., 1000',
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _redeemPoints(BuildContext context, UserProvider userProvider, String item, int points) {
    final success = userProvider.redeemPoints(item, points);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(success
            ? '$item redeemed successfully'
            : 'Insufficient points for $item'),
      ),
    );
  }
}