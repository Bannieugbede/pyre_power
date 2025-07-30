import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pyre_eco_mint/views/dashboard_screen.dart';
import 'package:pyre_eco_mint/views/education_screen.dart';
import 'package:pyre_eco_mint/views/feedback_screen.dart';
import 'package:pyre_eco_mint/views/guidelines_screen.dart';
import 'package:pyre_eco_mint/views/login_screen.dart';
import 'package:pyre_eco_mint/views/notifications_screen.dart';
import 'package:pyre_eco_mint/views/pickup_tracking_screen.dart';
import 'package:pyre_eco_mint/views/profile_screen.dart';
import 'package:pyre_eco_mint/views/rewards_screen.dart';
import 'package:pyre_eco_mint/views/schedule_pickup_screen.dart';
import 'package:pyre_eco_mint/views/shop_screen.dart';
import 'package:pyre_eco_mint/views/signup_screen.dart';
import 'package:pyre_eco_mint/views/subscription_screen.dart';
import 'package:pyre_eco_mint/views/trash_classification_screen.dart';
import 'package:pyre_eco_mint/views/verification_screen.dart';
import 'package:pyre_eco_mint/views/wallet_screen.dart';
import 'controllers/user_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const PyreEcoMintApp(),
    ),
  );
}

class PyreEcoMintApp extends StatelessWidget {
  const PyreEcoMintApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pyre-EcoMint',
      theme: ThemeData(
        primaryColor: const Color(0xFF2E7D32),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E7D32),
          primary: const Color(0xFF2E7D32),
          secondary: const Color(0xFF4CAF50),
          surface: Colors.white,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[100],
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87),
          headlineMedium: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black54),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2E7D32),
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          ),
        ),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/wallet': (context) => const WalletScreen(),
        '/notifications': (context) => NotificationsScreen(),
        '/schedule_pickup': (context) => const SchedulePickupScreen(),
        '/feedback': (context) => const FeedbackScreen(),
        '/guidelines': (context) => GuidelinesScreen(),
        '/education': (context) => EducationScreen(),
        '/rewards': (context) => RewardsScreen(),
        '/shop': (context) => ShopScreen(),
        '/pickup_tracking': (context) => PickupTrackingScreen(),
        '/subscription': (context) => const SubscriptionScreen(),
        '/verification': (context) => const VerificationScreen(),
        '/trash_classification': (context) => const TrashClassificationScreen(),
      },
    );
  }
}
