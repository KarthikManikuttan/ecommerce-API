import 'package:flutter/material.dart';

class PaymentDonePage extends StatefulWidget {
  const PaymentDonePage({super.key});

  @override
  State<PaymentDonePage> createState() => _PaymentDonePageState();
}

class _PaymentDonePageState extends State<PaymentDonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Text("test test"),
          )
        ],
      ),
    );
  }
}
