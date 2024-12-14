import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel/pages/SuccessTransactionScreen.dart';

class ConfirmOrderScreen extends StatelessWidget {
  final String paymentMethod;
  final String paymentLogo;

  ConfirmOrderScreen({required this.paymentMethod, required this.paymentLogo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konfirmasi Pesanan'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildInfoCard(
              icon: Icons.access_time,
              title: 'Selesaikan Pembayaran Sebelum',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '13.26 PM',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Selesaikan pembayaran dalam 00:58:33',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildInfoCard(
              icon: Icons.receipt_long,
              title: 'Mohon Transfer ke',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(paymentLogo, width: 50, height: 50),
                      SizedBox(width: 10),
                      Text(
                        paymentMethod,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Text(
                          '8319 0010 0534 1091',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: '8319 0010 0534 1091'));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Nomor rekening disalin ke clipboard')),
                            );
                          },
                          child: Text('Salin'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildInfoCard(
              icon: Icons.money,
              title: 'Total Pembayaran',
              content: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Text(
                      'Rp 1.859.800',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: 'Rp 1.859.800'));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Jumlah pembayaran disalin ke clipboard')),
                        );
                      },
                      child: Text('Salin'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'PENTING! Mohon transfer sesuai jumlah yang tertera',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            _buildInfoCard(
              icon: Icons.check_circle,
              title: 'Sudah Menyelesaikan Transaksi?',
              content: Text(
                'Setelah pembayaran Anda dikonfirmasi, kami akan mengirim bukti pembelian dan e-tiket penerbangan ke alamat email Anda.',
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) => SuccessTransactionScreen(paymentLogoPath: paymentLogo, paymentMethod: paymentMethod),
                    ),
                  );
                },
                child: Text('Saya Sudah Bayar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({required IconData icon, required String title, required Widget content}) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: Colors.teal),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    content,
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
