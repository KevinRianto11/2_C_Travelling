import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Metode Pembayaran'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: [
          _buildPaymentCategory(
            context,
            categoryTitle: 'Bank Transfer',
            paymentOptions: [
              _buildPaymentOption(
                context,
                logos: ['assets/banks/bca.png'],
                title: 'BCA',
                onTap: () {
                  Navigator.pop(context, 'BCA');
                },
              ),
              _buildPaymentOption(
                context,
                logos: ['assets/banks/mandiri.png'],
                title: 'Mandiri',
                onTap: () {
                  Navigator.pop(context, 'Mandiri');
                },
              ),
              _buildPaymentOption(
                context,
                logos: ['assets/banks/bri.png'],
                title: 'BRI',
                onTap: () {
                  Navigator.pop(context, 'BRI');
                },
              ),
              _buildPaymentOption(
                context,
                logos: ['assets/banks/bni.png'],
                title: 'BNI',
                onTap: () {
                  Navigator.pop(context, 'BNI');
                },
              ),
            ],
          ),
          SizedBox(height: 40),
          _buildPaymentCategory(
            context,
            categoryTitle: 'ATM',
            paymentOptions: [
              _buildPaymentOption(
                context,
                logos: ['assets/banks/atm_bersama.png'],
                title: 'ATM Bersama',
                onTap: () {
                  Navigator.pop(context, 'ATM Bersama');
                },
              ),
              _buildPaymentOption(
                context,
                logos: ['assets/banks/atm_prima.png'],
                title: 'ATM Prima',
                onTap: () {
                  Navigator.pop(context, 'ATM Prima');
                },
              ),
              _buildPaymentOption(
                context,
                logos: ['assets/banks/alto.png'],
                title: 'ALTO',
                onTap: () {
                  Navigator.pop(context, 'ALTO');
                },
              ),
            ],
          ),
          SizedBox(height: 40),
          _buildPaymentCategory(
            context,
            categoryTitle: 'Kartu Kredit/Debit',
            paymentOptions: [
              _buildPaymentOption(
                context,
                logos: ['assets/banks/visa.png'],
                title: 'Visa',
                onTap: () {
                  Navigator.pop(context, 'Visa');
                },
              ),
              _buildPaymentOption(
                context,
                logos: ['assets/banks/master_card.png'],
                title: 'MasterCard',
                onTap: () {
                  Navigator.pop(context, 'MasterCard');
                },
              ),
              _buildPaymentOption(
                context,
                logos: ['assets/banks/jcb.png'],
                title: 'JCB',
                onTap: () {
                  Navigator.pop(context, 'JCB');
                },
              ),
              _buildPaymentOption(
                context,
                logos: ['assets/banks/amex.jpeg'],
                title: 'AMEX',
                onTap: () {
                  Navigator.pop(context, 'AMEX');
                },
              ),
            ],
          ),
          SizedBox(height: 40),
          _buildPaymentCategory(
            context,
            categoryTitle: 'Minimarket',
            paymentOptions: [
              _buildPaymentOption(
                context,
                logos: ['assets/banks/alfamart.png'],
                title: 'Alfamart',
                onTap: () {
                  Navigator.pop(context, 'Alfamart');
                },
              ),
              _buildPaymentOption(
                context,
                logos: ['assets/banks/alfamidi.png'],
                title: 'Alfamidi',
                onTap: () {
                  Navigator.pop(context, 'Alfamidi');
                },
              ),
              _buildPaymentOption(
                context,
                logos: ['assets/banks/indomaret.png'],
                title: 'Indomaret',
                onTap: () {
                  Navigator.pop(context, 'Indomaret');
                },
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildPaymentCategory(
    BuildContext context, {
    required String categoryTitle,
    required List<Widget> paymentOptions,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            categoryTitle,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Column(children: paymentOptions),
      ],
    );
  }

  Widget _buildPaymentOption(
    BuildContext context, {
    required String title,
    List<String>? logos,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(8.0),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              if (logos != null && logos.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Image.asset(logos[0], height: 20),
                ),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
