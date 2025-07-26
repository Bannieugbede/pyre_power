import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../models/transaction_model.dart';
import '../widget_files/custom_button.dart';
import '../widget_files/custom_text_field.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({super.key});

  final List<Transaction> transactions = [
    Transaction(id: '1', type: 'pickup', amount: 2500.0, date: '2025-07-20'),
    Transaction(id: '2', type: 'withdrawal', amount: -5000.0, date: '2025-07-15'),
    Transaction(id: '3', type: 'bill_payment', amount: -3500.0, date: '2025-07-10'),
  ];

  final List<String> banks = [
    'GTBank',
    'Zenith Bank',
    'First Bank',
    'Access Bank',
    'UBA',
  ];

  final List<String> utilities = [
    'PHCN (Electricity)',
    'DSTV',
    'GOtv',
    'Lagos Water Corporation',
    'MTN Airtime',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wallet')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Digital Wallet', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Balance', style: TextStyle(fontSize: 18)),
                      Text('₦5,250', style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.primary)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Transaction History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: Icon(
                        transaction.type == 'pickup'
                            ? Iconsax.receive_square
                            : transaction.type == 'withdrawal'
                            ? Iconsax.money_send
                            : Iconsax.receipt,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      title: Text('${transaction.type.replaceAll('_', ' ').capitalize()} - ${transaction.date}'),
                      trailing: Text(
                        '${transaction.amount > 0 ? '+' : ''}₦${transaction.amount.toStringAsFixed(2)}',
                        style: TextStyle(color: transaction.amount > 0 ? Colors.green : Colors.red),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              const Text('Withdraw Cash', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const CustomTextField(hintText: 'Amount (₦)', icon: Iconsax.money),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Bank',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Iconsax.bank),
                ),
                items: banks.map((String bank) {
                  return DropdownMenuItem<String>(
                    value: bank,
                    child: Text(bank),
                  );
                }).toList(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              const CustomTextField(hintText: 'Account Number', icon: Iconsax.card),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Withdraw',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Withdrawal Requested!')),
                  );
                },
              ),
              const SizedBox(height: 16),
              const Text('Pay Bills', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Utility',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Iconsax.receipt),
                ),
                items: utilities.map((String utility) {
                  return DropdownMenuItem<String>(
                    value: utility,
                    child: Text(utility),
                  );
                }).toList(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              const CustomTextField(hintText: 'Bill Amount (₦)', icon: Iconsax.money),
              const SizedBox(height: 16),
              const CustomTextField(hintText: 'Account/Meter Number', icon: Iconsax.card),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Pay Bill',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Bill Payment Processed!')),
                  );
                },
              ),
              const SizedBox(height: 16),
              const Text('Payment Methods', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ListTile(
                leading: const Icon(Iconsax.card, color: Color(0xFF2E7D32)),
                title: const Text('GTBank **** 1234'),
                trailing: IconButton(
                  icon: const Icon(Iconsax.trash),
                  onPressed: () {},
                ),
              ),
            ],
          ),
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