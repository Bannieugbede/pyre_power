import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../controllers/user_provider.dart';
import 'profile_screen.dart';
import 'wallet_screen.dart';
import 'notifications_screen.dart';
import 'schedule_pickup_screen.dart';
import 'feedback_screen.dart';
import 'guidelines_screen.dart';
import 'education_screen.dart';
import 'recycling_points_screen.dart';
import 'rewards_screen.dart';
import 'shop_screen.dart';
import 'pickup_tracking_screen.dart';
import 'waste_management_hub_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeContent(),
    const WasteManagementHubScreen(),
    const SchedulePickupScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pyre Power'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Iconsax.user, color: Color(0xFF2E7D32)),
            onPressed: () {
              setState(() {
                _selectedIndex = 3; // Switch to Profile tab
              });
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
              child: const Text(
                'Pyre Power Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Iconsax.wallet, color: Color(0xFF2E7D32)),
              title: const Text('Wallet'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WalletScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Iconsax.notification, color: Color(0xFF2E7D32)),
              title: const Text('Notifications'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Iconsax.book, color: Color(0xFF2E7D32)),
              title: const Text('Guidelines'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GuidelinesScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Iconsax.teacher, color: Color(0xFF2E7D32)),
              title: const Text('Education'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EducationScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Iconsax.location, color: Color(0xFF2E7D32)),
              title: const Text('Recycling Points'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RecyclingPointsScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Iconsax.award, color: Color(0xFF2E7D32)),
              title: const Text('Rewards'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RewardsScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Iconsax.shop, color: Color(0xFF2E7D32)),
              title: const Text('Shop'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShopScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Iconsax.ranking, color: Color(0xFF2E7D32)),
              title: const Text('Pickup Tracking'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PickupTrackingScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Iconsax.message, color: Color(0xFF2E7D32)),
              title: const Text('Feedback & Support'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FeedbackScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Iconsax.logout, color: Color(0xFF2E7D32)),
              title: const Text('Logout'),
              onTap: () {
                userProvider.logout();
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.link),
            label: 'Waste Hub',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.truck),
            label: 'Pickup',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.user),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF2E7D32),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 8,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, ${userProvider.userName}!',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('Your Impact', style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatCard(context, 'Waste Recycled', '50 kg', Iconsax.receive_square),
                        _buildStatCard(context, 'Points Earned', '${userProvider.ecoPoints}', Iconsax.star),
                        _buildStatCard(context, 'Wallet Bal', '₦5,250', Iconsax.wallet),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('Quick Actions', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.2,
              children: [
                _buildQuickActionCard(
                  context,
                  title: 'Schedule Pickup',
                  icon: Iconsax.truck,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SchedulePickupScreen()),
                    );
                  },
                ),
                _buildQuickActionCard(
                  context,
                  title: 'Find Recycling',
                  icon: Iconsax.location,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RecyclingPointsScreen()),
                    );
                  },
                ),
                _buildQuickActionCard(
                  context,
                  title: 'View Wallet',
                  icon: Iconsax.wallet,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WalletScreen()),
                    );
                  },
                ),
                _buildQuickActionCard(
                  context,
                  title: 'Waste Hub',
                  icon: Iconsax.link,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WasteManagementHubScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary, size: 40),
        const SizedBox(height: 8),
        Text(value, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
        Text(title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
      ],
    );
  }

  Widget _buildQuickActionCard(BuildContext context, {required String title, required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 40, color: const Color(0xFF2E7D32)),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2E7D32),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}