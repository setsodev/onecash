import 'package:flutter/material.dart';
import 'package:onecash/models/textformfield.dart';
import 'package:onecash/screens/register/form.dart';
import 'package:onecash/screens/register/otp.dart';
import 'package:onecash/widgets/responsive_widget.dart';

class VerifyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: VerifyPage(),
      ),
    );
  }
}

class VerifyPage extends StatefulWidget {
  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController phoneController = TextEditingController();
  TextEditingController numberController = TextEditingController();
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
            otpForm(),
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
                  builder: (context) => OtpScreen(),
                ),
              );
            },
            child: new Icon(
              Icons.arrow_back,
              size: 40,
            ),
          )
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
            "Verification",
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
              "We have sent an SMS verification code to your number. Enter it below to continue",
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

  Widget otpForm() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 20.0, right: _width / 12.0, top: _height / 15.0),
      child: Form(
          key: _key,
          child: Column(
            children: <Widget>[
              otpTextFormField(),
            ],
          )),
    );
  }

  Widget otpTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.number,
      textEditingController: numberController,
      icon: Icons.dialpad,
      hint: "Enter Verification Code",
    );
  }

  Widget continueButton() {
    return Container(
        margin: EdgeInsets.only(left: _width / 20.0, top: 40),
        child: Row(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                print("Route to Form");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormScreen(),
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
            )
          ],
        ));
  }
}
