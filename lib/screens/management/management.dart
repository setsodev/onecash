import 'package:flutter/material.dart';

class ManagementScreen extends StatefulWidget {
  @override
  _ManagementScreenState createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Management Screen',
        style: TextStyle(
          fontFamily: "worksans",
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
