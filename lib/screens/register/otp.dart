import 'package:flutter/material.dart';
import 'package:onecash/models/textformfield.dart';
import 'package:onecash/screens/login/login_page.dart';
import 'package:onecash/screens/register/verify.dart';
import 'package:onecash/widgets/responsive_widget.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      child: Container(
        height: _height,
        width: _width,
        padding: EdgeInsets.only(bottom: 5),
        child: Column(
          children: <Widget>[
            iconRow(),
            titleRow(),
            welcomeTextRow(),
            descTextRow(),
            form(),
            continueButton(),
          ],
        ),
      ),
    );
  }

  Widget iconRow() {
    return Container(
      margin: EdgeInsets.only(left: 1, top: 50),
      child: Row(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              print('back');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LogInPage(),
                ),
              );
            },
            child: new Icon(
              Icons.arrow_back,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }

  Widget titleRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20, top: 100),
      child: Row(
        children: <Widget>[
          Text(
            "P",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: _large ? 52 : (_medium ? 50 : 40),
                fontFamily: 'JosefinSans'),
          ),
        ],
      ),
    );
  }

  Widget welcomeTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20, top: 100, bottom: 20),
      child: Row(
        children: <Widget>[
          Text(
            "Registration",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 36,
              fontFamily: 'JosefinSans',
            ),
          ),
        ],
      ),
    );
  }

  Widget descTextRow() {
    return Container(
      margin: EdgeInsets.only(
        left: _width / 20.0,
        right: 50,
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Text(
              "Enter your mobile number, we will send you OTP to verify",
              style: TextStyle(
                color: Colors.grey[600],
                fontFamily: 'JosefinSans',
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 20.0, right: _width / 12.0, top: _height / 15.0),
      child: Form(
          key: _key,
          child: Column(
            children: <Widget>[
              phoneTextFormField(),
            ],
          )),
    );
  }

  Widget phoneTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.phone,
      textEditingController: phoneController,
      icon: Icons.phone_iphone,
      hint: "Enter Phone Number",
    );
  }

  Widget continueButton() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20.0, top: 40),
      child: Row(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              print('Route to Verification');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VerifyScreen(),
                ),
              );
            },
            textColor: Colors.white,
            padding: EdgeInsets.all(0.0),
            child: Container(
              alignment: Alignment.center,
              width: 370,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                gradient: LinearGradient(
                  colors: <Color>[Colors.red, Colors.red],
                ),
              ),
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Continue',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  fontFamily: 'JosefinSans',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
