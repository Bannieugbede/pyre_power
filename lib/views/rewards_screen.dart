import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

class RewardsScreen extends StatelessWidget {
  RewardsScreen({super.key});

  final List<Transaction> transactions = [
    Transaction(id: '1', type: 'pickup', points: 10, date: '2025-07-20'),
    Transaction(id: '2', type: 'pickup', points: 15, date: '2025-07-15'),
    Transaction(id: '3', type: 'purchase', points: -50, date: '2025-07-10'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rewards')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Your Rewards', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Points Earned', style: TextStyle(fontSize: 18)),
                    Text('120', style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.primary)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Points History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(
                        transaction.type == 'pickup' ? Icons.recycling : Icons.shop,
                        color: const Color(0xFF2E7D32),
                      ),
                      title: Text('${transaction.type.capitalize()} - ${transaction.date}'),
                      trailing: Text(
                        '${transaction.points > 0 ? '+' : ''}${transaction.points} points',
                        style: TextStyle(color: transaction.points > 0 ? Colors.green : Colors.red),
                      ),
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

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}