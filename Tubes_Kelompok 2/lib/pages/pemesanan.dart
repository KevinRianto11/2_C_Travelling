import 'package:flutter/material.dart';
import 'package:travel/entity/driver.dart';
import 'package:travel/client/shared_preference.dart';
import 'package:travel/client/driverClient.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/pages/loginScreen.dart';
import 'package:travel/pages/transaksi.dart';

class CarRentalScreen extends StatefulWidget {
  @override
  _CarRentalScreenState createState() => _CarRentalScreenState();
}

class _CarRentalScreenState extends State<CarRentalScreen> {
  late Future<List<Driver>> _futureDrivers;

  @override
  void initState() {
    super.initState();
    _futureDrivers = _fetchDrivers();
  }

  Future<List<Driver>> _fetchDrivers() async {
    try {
      final token = await SharedPreference().getToken();
      if (token == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen())
        );
        throw Exception('Silakan login terlebih dahulu');
      }

      return await DriverClient.fetchAll();
    } catch (e) {
      print("Error fetching data: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal mengambil data: $e'),
          backgroundColor: Colors.red,
        )
      );
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Driver"),
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder<List<Driver>>(
        future: _futureDrivers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: TextStyle(color: Colors.red),
              ),
            );
          } else if (snapshot.hasData) {
            final driverList = snapshot.data!;
            return ListView.builder(
              itemCount: driverList.length,
              itemBuilder: (context, index) {
                final driver = driverList[index];
                return DriverCard(
                  name: driver.nama_driver,
                  vehicle: driver.merk_kendaraan,
                  number: driver.nomor_kendaraan,
                  phone: driver.no_telp,
                  driverPhoto: driver.foto_driver, // Use driver.foto_driver
                );
              },
            );
          } else {
            return Center(child: Text("Tidak ada data tersedia"));
          }
        },
      ),
    );
  }
}

class DriverCard extends StatelessWidget {
  final String name;
  final String vehicle;
  final String number;
  final String phone;
  final String? driverPhoto;

  DriverCard({
    required this.name,
    required this.vehicle,
    required this.number,
    required this.phone,
    required this.driverPhoto,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl =  driverPhoto!= null && driverPhoto!.isNotEmpty
        ? 'http://10.0.2.2:8000/storage/driver_picture/${driverPhoto}'
        : '';
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => TransaksiPage()));
      },
      child: Card(
        elevation: 4,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              driverPhoto != null && driverPhoto!.isNotEmpty
                ? Image.network(
                    imageUrl!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container (
                        width: 60,
                        height: 60,
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.error_outline,
                          color: Colors.grey,
                        ),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        width: 60,
                        height: 60,
                        color: Colors.grey[200],
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  )
                : Icon(Icons.person, size: 60, color: Colors.teal),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(vehicle),
                    Text(number),
                    Text(phone),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
