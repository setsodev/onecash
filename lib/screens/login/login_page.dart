import 'package:flutter/material.dart';
import 'package:onecash/screens/login/login_screen.dart';
import 'package:onecash/screens/onboarding.dart';
import 'package:onecash/screens/register/otp.dart';
import 'package:onecash/widgets/responsive_widget.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;

  final infoHeight = 364.0;
  AnimationController animationController;
  Animation<double> animation;
  var opacity1 = 0.0;
  var opacity2 = 0.0;
  var opacity3 = 0.0;
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              iconRow(),
              titleRow(),
              welcomeTextRow(),
              descTextRow(),
              loginRow(),
              openAccount(),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconRow() {
    return Container(
      margin: EdgeInsets.only(left: 0, top: 50),
      child: Row(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              print("Back to Onboarding Screen");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OnBoardingScreen(),
                ),
              );
            },
            child: new Icon(
              Icons.subject,
              color: Colors.black,
              size: 40.0,
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
            "0",
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
      margin: EdgeInsets.only(left: _width / 20, top: 130, bottom: 20),
      child: Row(
        children: <Widget>[
          Text(
            "Welcome",
            style: TextStyle(
              color: Colors.grey[600],
//              fontWeight: FontWeight.bold,
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
      margin: EdgeInsets.only(left: _width / 20.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Text(
              "Lorem ipsum dolor sit amet, consect adipiscing elit. Lorem ipsum dolor sit ametconsect adipiscing elit.",
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

  Widget loginRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20.0, top: 50),
      child: Row(
//        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                print('login page');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => LogInScreen(),
                  ),
                );
              },
              textColor: Colors.white,
              padding: EdgeInsets.all(0.0),
              child: Container(
                alignment: Alignment.center,
                width: 250,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  gradient: LinearGradient(
                    colors: <Color>[Colors.grey[900], Colors.black],
                  ),
                ),
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: 'JosefinSans',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
              icon: Image.asset('assets/icons/faceID.png'),
              onPressed: () {
                print('BioLogin');
              },
              iconSize: 70,
            )
          ]),
    );
  }

  Widget openAccount() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20.0, top: 20),
      child: Row(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              print('Open Account');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => OtpScreen(),
                ),
              );
            },
            textColor: Colors.white,
            padding: EdgeInsets.all(0.0),
            child: Container(
              alignment: Alignment.center,
              width: 330,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                gradient: LinearGradient(
                  colors: <Color>[Colors.red, Colors.red],
                ),
              ),
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Create An Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
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
