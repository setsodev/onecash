import 'package:flutter/material.dart';

class CashOutScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CashOutScreenState();
}

class _CashOutScreenState extends State<CashOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Cashout',
          style: TextStyle(
              inherit: true, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/icons/qr-code.png'),
            padding: EdgeInsets.only(right: 20.0),
            onPressed: () {
              print('QR CODE');
            },
            iconSize: 20,
          ),
        ],
      ),
    );
  }
}
