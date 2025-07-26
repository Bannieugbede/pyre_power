import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'user_hub_screen.dart';
import 'disposal_company_screen.dart';
import 'recycling_company_screen.dart';
import 'clean_energy_company_screen.dart';

class WasteManagementHubScreen extends StatelessWidget {
  const WasteManagementHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Waste Management Hub'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Connect with Waste Management Services',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: const Icon(Iconsax.user, color: Color(0xFF2E7D32)),
                title: const Text('User Hub'),
                subtitle: const Text('Request waste pickups or recycling services'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserHubScreen()),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const Icon(Iconsax.truck, color: Color(0xFF2E7D32)),
                title: const Text('Waste Disposal Companies'),
                subtitle: const Text('Manage waste collection requests'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DisposalCompanyScreen()),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: Icon(Iconsax.trash, color: Color(0xFF2E7D32)),
                title: const Text('Recycling Companies'),
                subtitle: const Text('Manage recyclable pickups'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RecyclingCompanyScreen()),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const Icon(Iconsax.battery_charging, color: Color(0xFF2E7D32)),
                title: const Text('Clean Energy Companies'),
                subtitle: const Text('Manage waste-to-energy requests'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CleanEnergyCompanyScreen()),
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