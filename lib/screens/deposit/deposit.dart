import 'package:flutter/material.dart';

class DepositScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
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
          'Deposit',
          style: TextStyle(
              inherit: true, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
