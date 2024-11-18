// profile_screen.dart
import 'package:flutter/material.dart';
import 'package:tubes/profiles/delete_akun.dart';
import 'package:tubes/profiles/update.dart';
import 'package:tubes/profiles/update_password.dart';
import 'package:tubes/profiles/delete_akun.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
           
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  colors: [
                    Color.fromARGB(255, 70, 156, 241),
                    Color.fromARGB(255, 26, 79, 133),
                    Color(0xFF0066CC),
                  ],
                  stops: [0.1, 0.6, 1.0],
                ),
                color: Color(0xFF0066CC),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      const Text(
                        "Akun",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(
                          Icons.person_outline,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Hi, Vincent Alexander Li",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

           Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildMenuItem(
                      "Data Diri", 
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Update(),
                          ),
                        );
                      }
                    ),
                    _buildMenuItem(
                      "Ganti Kata Sandi",
                       onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChangePassword(),
                          ),
                        );
                      }
                    ),
                    _buildMenuItem(
                      "Hapus Akun", 
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DeleteAkun(),
                          ),
                        );
                      }
                    ),
                    _buildMenuItem("Keluar", onTap: () {}, isLogout: true),
                  ],
                ),
              ),
            ),

            const Spacer(),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem("Home", Icons.home_outlined, false),
                  _buildNavItem("Order", Icons.shopping_bag_outlined, false),
                  _buildNavItem("Akun", Icons.person_outline, true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, {required VoidCallback onTap, bool isLogout = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: isLogout ? Colors.red : Colors.black87,
            fontSize: 16,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildNavItem(String label, IconData icon, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isSelected ? const Color(0xFF0066CC) : Colors.grey,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? const Color(0xFF0066CC) : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}