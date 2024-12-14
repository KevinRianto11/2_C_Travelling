import 'package:flutter/material.dart';
import 'package:travel/pages/pembayaran.dart'; 
import 'package:travel/pages/confirmOrder.dart';// Import the new page

class TransaksiPage extends StatefulWidget {
  @override
  _TransaksiPageState createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  String selectedPaymentMethod = 'Transfer Bank';
  String selectedPaymentLogo = 'assets/banks/bri.png'; // Initialize with default logo

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaksi'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildTransaksiCategory(
            context,
            categoryTitle: 'Metode Pembayaran',
            onTitleTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentScreen(),
                ),
              );
              if (result != null) {
                setState(() {
                  selectedPaymentMethod = result;
                  selectedPaymentLogo = _getPaymentLogo(result);
                });
              }
            },
            content: Row(
              children: [
                Image.asset(
                  selectedPaymentLogo,
                  width: 50,
                  height: 50,
                ),
                SizedBox(width: 10),
                Text(selectedPaymentMethod),
              ],
            ),
          ),
          SizedBox(height: 10),
          _buildTransaksiCategory(
            context,
            categoryTitle: 'Nama Pemilik Rekening',
            content: Text('Sardo Berlou'),
          ),
          SizedBox(height: 10),
          _buildTransaksiCategory(
            context,
            categoryTitle: 'Perhatian',
            content: Text(
              'Anda bisa transfer dari layanan perbankan apapun (internet banking, SMS/M-Banking, ATM).',
            ),
          ),
          SizedBox(height: 10),
          _buildTransaksiCategory(
            context,
            categoryTitle: 'Harga Pesanan',
            content: Column(
              children: [
                _buildPriceRow('Total Pembayaran', 'Rp648.200'),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Harga',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      'Rp696.200',
                      style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push( 
                        context, 
                        MaterialPageRoute( 
                          builder: (context) => ConfirmOrderScreen( 
                            paymentMethod: selectedPaymentMethod, 
                            paymentLogo: selectedPaymentLogo, 
                          ), 
                        ), 
                      );
                    },
                    child: Text('Bayar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransaksiCategory(
    BuildContext context, {
    required String categoryTitle,
    required Widget content,
    void Function()? onTitleTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  categoryTitle,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                if (onTitleTap != null)
                  InkWell(
                    onTap: onTitleTap,
                    child: Text(
                      'Change',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
              ],
            ),
          ),
          content,
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(price),
        ],
      ),
    );
  }

  String _getPaymentLogo(String paymentMethod) {
    switch (paymentMethod) {
      case 'BCA':
        return 'assets/banks/bca.png';
      case 'Mandiri':
        return 'assets/banks/mandiri.png';
      case 'BRI':
        return 'assets/banks/bri.png';
      case 'BNI':
        return 'assets/banks/bni.png';
      case 'ATM Bersama':
        return 'assets/banks/atm_bersama.png';
      case 'ATM Prima':
        return 'assets/banks/atm_prima.png';
      case 'ALTO':
        return 'assets/banks/alto.png';
      case 'Visa':
        return 'assets/banks/visa.png';
      case 'MasterCard':
        return 'assets/banks/master_card.png';
      case 'JCB':
        return 'assets/banks/jcb.png';
      case 'AMEX':
        return 'assets/banks/amex.jpeg';
      case 'Alfamart':
        return 'assets/banks/alfamart.png';
      case 'Alfamidi':
        return 'assets/banks/alfamidi.png';
      case 'Indomaret':
        return 'assets/banks/indomaret.png';
      default:
        return 'assets/banks/default.png';
    }
  }
}
