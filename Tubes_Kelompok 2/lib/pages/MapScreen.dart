import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  
  LatLng? _pickupLocation;
  LatLng? _destinationLocation;
  LatLng? _currentLocation;
  List<LatLng> routePoints = [];
  String _distance = '';
  String _duration = '';
  
  bool _isPickingPickup = false;
  bool _isPickingDestination = false;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Mendapatkan lokasi saat ini
  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        Position position = await Geolocator.getCurrentPosition();
        setState(() {
          _currentLocation = LatLng(position.latitude, position.longitude);
          _mapController.move(_currentLocation!, 15);
        });
      }
    } catch (e) {
      print('Error getting current location: $e');
    }
  }

  // Fungsi untuk memulai pemilihan lokasi
  void _startLocationPicking(bool isPickup) {
    setState(() {
      _isPickingPickup = isPickup;
      _isPickingDestination = !isPickup;
    });
  }

  // Fungsi untuk mengonfirmasi lokasi yang dipilih
  void _confirmLocation() {
    final centerLocation = _mapController.camera.center;
    setState(() {
      if (_isPickingPickup) {
        _pickupLocation = centerLocation;
        _getLocationAddress(centerLocation, true);
        _isPickingPickup = false;
      } else if (_isPickingDestination) {
        _destinationLocation = centerLocation;
        _getLocationAddress(centerLocation, false);
        _isPickingDestination = false;
      }
    });

    if (_pickupLocation != null && _destinationLocation != null) {
      getRoute();
    }
  }

  // Mendapatkan alamat dari koordinat menggunakan Nominatim
  Future<void> _getLocationAddress(LatLng location, bool isPickup) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://nominatim.openstreetmap.org/reverse?format=json'
          '&lat=${location.latitude}&lon=${location.longitude}'
        ),
        headers: {'Accept': 'application/json'}
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final address = data['display_name'];
        
        setState(() {
          if (isPickup) {
            _pickupController.text = address;
          } else {
            _destinationController.text = address;
          }
        });
      }
    } catch (e) {
      print('Error getting address: $e');
    }
  }

  // Fungsi untuk mendapatkan rute menggunakan OSRM
  Future<void> getRoute() async {
    if (_pickupLocation == null || _destinationLocation == null) return;

    try {
      final response = await http.get(
        Uri.parse(
          'https://router.project-osrm.org/route/v1/driving/'
          '${_pickupLocation!.longitude},${_pickupLocation!.latitude};'
          '${_destinationLocation!.longitude},${_destinationLocation!.latitude}'
          '?overview=full&geometries=geojson'
        )
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['routes'].isNotEmpty) {
          final route = data['routes'][0];
          final geometry = route['geometry']['coordinates'];
          
          setState(() {
            routePoints = geometry
                .map<LatLng>((coord) => LatLng(coord[1], coord[0]))
                .toList();
            
            final distance = route['distance'] / 1000; // Convert to km
            final duration = route['duration'] / 60; // Convert to minutes
            
            _distance = '${distance.toStringAsFixed(2)} km';
            _duration = '${duration.toStringAsFixed(0)} menit';
          });

          // Zoom ke rute
          final bounds = LatLngBounds.fromPoints(routePoints);
          _mapController.fitBounds(
            bounds,
            options: const FitBoundsOptions(padding: EdgeInsets.all(50))
          );
        }
      }
    } catch (e) {
      print('Error getting route: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan Perjalanan'),
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: LatLng(-7.7956, 110.3695),
              initialZoom: 13,
              onMapReady: () {
                if (_currentLocation != null) {
                  _mapController.move(_currentLocation!, 15);
                }
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  if (_pickupLocation != null && !_isPickingPickup)
                    Marker(
                      point: _pickupLocation!,
                      width: 80,
                      height: 80,
                      child: Icon(Icons.location_on, color: Colors.green),
                    ),
                  if (_destinationLocation != null && !_isPickingDestination)
                    Marker(
                      point: _destinationLocation!,
                      width: 80,
                      height: 80,
                      child: Icon(Icons.location_on, color: Colors.red),
                    ),
                ],
              ),
              PolylineLayer(
                polylines: [
                  if (routePoints.isNotEmpty)
                    Polyline(
                      points: routePoints,
                      color: Colors.blue,
                      strokeWidth: 3,
                    ),
                ],
              ),
            ],
          ),
          // Center Pin ketika memilih lokasi
          if (_isPickingPickup || _isPickingDestination)
            Center(
              child: Icon(
                Icons.location_on,
                color: _isPickingPickup ? Colors.green : Colors.red,
                size: 50,
              ),
            ),
          // Input lokasi
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => _startLocationPicking(true),
                      child: AbsorbPointer(
                        child: TextField(
                          controller: _pickupController,
                          decoration: InputDecoration(
                            icon: Icon(Icons.location_on, color: Colors.green),
                            hintText: 'Pilih lokasi penjemputan',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: () => _startLocationPicking(false),
                      child: AbsorbPointer(
                        child: TextField(
                          controller: _destinationController,
                          decoration: InputDecoration(
                            icon: Icon(Icons.location_on, color: Colors.red),
                            hintText: 'Pilih lokasi tujuan',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Tombol konfirmasi lokasi
          if (_isPickingPickup || _isPickingDestination)
            Positioned(
              bottom: 20,
              left: 10,
              right: 10,
              child: ElevatedButton(
                onPressed: _confirmLocation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text(
                  'Konfirmasi Lokasi',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          // Info jarak dan waktu
          if (_distance.isNotEmpty && _duration.isNotEmpty && !_isPickingPickup && !_isPickingDestination)
            Positioned(
              bottom: 20,
              left: 10,
              right: 10,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Jarak', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(_distance),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Waktu', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(_duration),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}