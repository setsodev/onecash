import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Wallet Screen',
        style: TextStyle(
          fontFamily: "worksans",
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
