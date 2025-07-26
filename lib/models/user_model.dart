class User {
  final String name;
  final String email;
  final int points;
  final double walletBalance;

  User({
    required this.name,
    required this.email,
    this.points = 0,
    this.walletBalance = 0.0,
  });
}