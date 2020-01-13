import 'package:flutter/material.dart';
import 'package:onecash/screens/onboarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OneCash Wallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.red,
          primaryColor: Colors.red),
      home: OnBoardingScreen(),
    );
  }
}
