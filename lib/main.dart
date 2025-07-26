import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pyre_power/views/clean_energy_company_screen.dart';
import 'package:pyre_power/views/dashboard_screen.dart';
import 'package:pyre_power/views/disposal_company_screen.dart';
import 'package:pyre_power/views/education_screen.dart';
import 'package:pyre_power/views/feedback_screen.dart';
import 'package:pyre_power/views/guidelines_screen.dart';
import 'package:pyre_power/views/login_screen.dart';
import 'package:pyre_power/views/notifications_screen.dart';
import 'package:pyre_power/views/pickup_tracking_screen.dart';
import 'package:pyre_power/views/profile_screen.dart';
import 'package:pyre_power/views/recycling_company_screen.dart';
import 'package:pyre_power/views/recycling_points_screen.dart';
import 'package:pyre_power/views/rewards_screen.dart';
import 'package:pyre_power/views/schedule_pickup_screen.dart';
import 'package:pyre_power/views/shop_screen.dart';
import 'package:pyre_power/views/signup_screen.dart';
import 'package:pyre_power/views/user_hub_screen.dart';
import 'package:pyre_power/views/wallet_screen.dart';
import 'package:pyre_power/views/waste_management_hub_screen.dart';
import 'controllers/user_provider.dart'; // Add import for UserProvider

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(), // Correctly reference UserProvider class
      child: const PyrePowerApp(),
    ),
  );
}

class PyrePowerApp extends StatelessWidget {
  const PyrePowerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pyre Power',
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
          headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87),
          headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black54),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2E7D32),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
        '/wallet': (context) => WalletScreen(),
        '/notifications': (context) => NotificationsScreen(),
        '/schedule_pickup': (context) => const SchedulePickupScreen(),
        '/feedback': (context) => const FeedbackScreen(),
        '/guidelines': (context) => GuidelinesScreen(),
        '/education': (context) => EducationScreen(),
        '/recycling_points': (context) => const RecyclingPointsScreen(),
        '/rewards': (context) => RewardsScreen(),
        '/shop': (context) => ShopScreen(),
        '/pickup_tracking': (context) => PickupTrackingScreen(),
        '/waste_management_hub': (context) => const WasteManagementHubScreen(),
        '/user_hub': (context) => const UserHubScreen(),
        '/disposal_company': (context) => DisposalCompanyScreen(),
        '/recycling_company': (context) => RecyclingCompanyScreen(),
        '/clean_energy_company': (context) => CleanEnergyCompanyScreen(),
      },
    );
  }
}