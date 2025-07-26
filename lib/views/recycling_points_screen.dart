import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RecyclingPointsScreen extends StatefulWidget {
  const RecyclingPointsScreen({super.key});

  @override
  State<RecyclingPointsScreen> createState() => _RecyclingPointsScreenState();
}

class _RecyclingPointsScreenState extends State<RecyclingPointsScreen> {
  bool _mapLoadError = false;

  final List<Map<String, dynamic>> recyclingPoints = [
    {
      'name': 'Lagos Recycling Hub',
      'location': '123 Eco Street, Ikeja, Lagos',
      'lat': 6.5244,
      'lng': 3.3792,
    },
    {
      'name': 'Green Recycle Center',
      'location': '456 Green Road, Surulere, Lagos',
      'lat': 6.4924,
      'lng': 3.3557,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recycling Points'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Find Recycling Points in Lagos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            _mapLoadError
                ? const Text(
              'Failed to load map. Please check your API key or internet connection.',
              style: TextStyle(color: Colors.red),
            )
                : Expanded(
              child: GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(6.5244, 3.3792), // Lagos coordinates
                  zoom: 12,
                ),
                markers: recyclingPoints
                    .map((point) => Marker(
                  markerId: MarkerId(point['name']),
                  position: LatLng(point['lat'], point['lng']),
                  infoWindow: InfoWindow(title: point['name']),
                ))
                    .toSet(),
                onMapCreated: (controller) {
                  setState(() {
                    _mapLoadError = false;
                  });
                },
                onCameraMove: (_) {},
                // Disable heavy operations to improve performance
                zoomControlsEnabled: false,
                myLocationEnabled: false,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Recycling Points List',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: recyclingPoints.length,
                itemBuilder: (context, index) {
                  final point = recyclingPoints[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: const Icon(Iconsax.location, color: Color(0xFF2E7D32)),
                      title: Text(point['name']),
                      subtitle: Text(point['location']),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Selected: ${point['name']}')),
                        );
                      },
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

  @override
  void initState() {
    super.initState();
    // Simulate checking for API key issues
    try {
      GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(0, 0),
          zoom: 1,
        ),
        onMapCreated: (_) {},
      );
    } catch (e) {
      setState(() {
        _mapLoadError = true;
      });
    }
  }
}