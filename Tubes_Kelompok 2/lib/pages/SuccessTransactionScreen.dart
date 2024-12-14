import 'package:flutter/material.dart';

class SuccessTransactionScreen extends StatelessWidget {
  final String paymentLogoPath;
  final String paymentMethod;

  SuccessTransactionScreen({required this.paymentMethod, required this.paymentLogoPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Success'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.teal),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 100,
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Pembayaran Berhasil!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
                ),
              ),
              Divider(height: 32, thickness: 2),
              Text(
                'Tanggal: 24 July 2023',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              Text(
                'ID Transaksi: PGBU4NRM6153',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              Text(
                'Jenis Pembayaran: Biaya Keberangkatan',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.1),
                  border: Border.all(color: Colors.teal),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pembayaran Via - Virtual Accounts',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Image.asset(
                          paymentLogoPath,
                          width: 60,
                          height: 60,
                        ),
                        SizedBox(width: 8),
                        Text(
                          paymentMethod,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'No. Virtual Account: 88908958960350601',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Detail Transaksi',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Keberangkatan: Rp 300.000',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
              ),
              Divider(height: 32, thickness: 2),
              SizedBox(height: 6),
              Text(
                'Total Bayar: Rp 300.000',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 26),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Download Bukti Pembayaran'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
