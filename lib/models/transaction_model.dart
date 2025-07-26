class Transaction {
  final String id;
  final String type; // 'pickup', 'withdrawal', 'bill_payment', 'purchase'
  final double amount;
  final int points;
  final String date;

  Transaction({
    required this.id,
    required this.type,
    this.amount = 0.0,
    this.points = 0,
    required this.date,
  });
}