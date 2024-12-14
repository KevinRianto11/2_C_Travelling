import 'package:flutter/material.dart';
import 'package:travel/client/tujuanClient.dart';
import 'package:travel/client/shared_preference.dart';
import 'package:travel/profiles/profile_screen.dart';
import 'package:travel/entity/tujuan.dart';
import 'package:travel/pages/tourist_details_page.dart';
import 'package:travel/pages/loginScreen.dart';
import 'package:travel/client/pemesananClient.dart';
import 'package:travel/entity/pemesanan.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _prefs = SharedPreference();
  final List<Widget> _screens = [
    const HomeScreen(),
    //const BookmarkPage(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    final token = await _prefs.getToken();
    if (token == null) {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack( // Gunakan IndexedStack untuk mempertahankan state
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.greenAccent.shade200,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Bookmark",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.shade200,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Image.asset(
          'assets/icons/Logo.png',
          width: 120,
          height: 50,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const Text('Travel App', style: TextStyle(fontSize: 18));
          },
        ),
      ),
      body: const SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Text(
                      "Tourist Destinations",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    NearbyPlaces(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class BookmarkPage extends StatelessWidget {
//   const BookmarkPage({Key? key}) : super(key: key);
//   final _prefs = SharedPreference();
  

//   Future<List<Pemesanan>> _fetchPemesanan() async {
//     final token = await _prefs.getToken();
//     return await PemesananClient.fetchAll(token);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bookmark Page'),
//         backgroundColor: Colors.teal,
//       ),
//       body: FutureBuilder<List<Pemesanan>>(
//         future: _fetchPemesanan(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else if (snapshot.hasData) {
//             final pemesananList = snapshot.data!;
//             return ListView.builder(
//               itemCount: pemesananList.length,
//               itemBuilder: (context, index) {
//                 final pemesanan = pemesananList[index];
//                 return ListTile(
//                   title: Text(pemesanan.status_pemesanan),
//                   subtitle: Text('Tanggal: ${pemesanan.status_pemesanan.toLocal()}'.split(' ')[0]),
//                 );
//               },
//             );
//           } else {
//             return Center(child: Text('Tidak ada pemesanan tersedia'));
//           }
//         },
//       ),
//     );
//   }
// }


class NearbyPlaces extends StatefulWidget {
  const NearbyPlaces({Key? key}) : super(key: key);

  @override
  State<NearbyPlaces> createState() => _NearbyPlacesState();
}

class _NearbyPlacesState extends State<NearbyPlaces> {
  late Future<List<Tujuan>> _futureNearbyPlaces;

  final _prefs = SharedPreference();

  @override
  void initState() {
    super.initState();
    _loadNearbyPlaces();
  }

  void _loadNearbyPlaces() {
    setState(() {
      _futureNearbyPlaces = TujuanClient.fetchAll();
    });
  }

  void _handleAuthError() async {
    await _prefs.clear();
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Tujuan>>(
      future: _futureNearbyPlaces,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
            ),
          );
        }

        if (snapshot.hasError) {
          if (snapshot.error.toString().contains('Not authenticated')) {
            _handleAuthError();
            return const SizedBox.shrink();
          }

          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Text(
                  'Error: ${snapshot.error}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent.shade200,
                  ),
                  onPressed: _loadNearbyPlaces,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        // if (!snapshot.hasData || snapshot.data!.isEmpty) {
        //   return const Center(
        //     child: Text(
        //       'No destinations available',
        //       style: TextStyle(
        //         fontSize: 16,
        //         color: Colors.grey,
        //       ),
        //     ),
        //   );
        // }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final place = snapshot.data![index];
            return DestinationCard(place: place);
          },
        );
      },
    );
  }
}

class DestinationCard extends StatelessWidget {
  final Tujuan place;

  const DestinationCard({
    Key? key,
    required this.place,
  }) : super(key: key);

  String _getImageUrl(String? photoName) {
    if (photoName == null || photoName.isEmpty) {
      return ''; // Return empty string for null or empty photo name
    }
    // Ensure the photo name is properly formatted
    final cleanPhotoName = photoName.trim();
    if (cleanPhotoName.isEmpty) {
      return '';
    }
    // Construct the full URL
    return 'http://10.0.2.2:8000/storage/wisata_picture/$cleanPhotoName';
  }

  Widget _buildImage(BuildContext context, String imageUrl) {
    if (imageUrl.isEmpty) {
      return Container(
        width: 120,
        height: 120,
        color: Colors.grey[200],
        child: const Icon(
          Icons.image_not_supported,
          color: Colors.grey,
          size: 40,
        ),
      );
    }

    return Image.network(
      imageUrl,
      width: 120,
      height: 120,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        print('Error loading image: $error');
        return Container(
          width: 120,
          height: 120,
          color: Colors.grey[200],
          child: const Icon(
            Icons.error_outline,
            color: Colors.grey,
            size: 40,
          ),
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          width: 120,
          height: 120,
          color: Colors.grey[200],
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
      // Add headers if needed
      headers: const {
        'Cache-Control': 'no-cache',
        'Pragma': 'no-cache',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = _getImageUrl(place.foto_wisata);
    print('Building DestinationCard for ${place.nama_tujuan} with image: $imageUrl');

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 0.4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TouristDetailsPage(
                  image: imageUrl,
                  title: place.nama_tujuan,
                  text: place.deskripsi,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: _buildImage(context, imageUrl),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          place.nama_tujuan,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: Text(
                            place.deskripsi,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}