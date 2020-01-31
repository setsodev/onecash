import 'package:flutter/material.dart';
import 'package:onecash/models/textformfield.dart';
import 'package:onecash/screens/login/login_page.dart';
import 'package:onecash/screens/nav.dart';
import 'package:onecash/widgets/responsive_widget.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();

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
              form(),
              forgetPassTextRow(),
              openHome(),
            ],
          ),
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
                  builder: (BuildContext context) => LogInPage(),
                ),
              );
            },
            child: new Icon(
              Icons.arrow_back,
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
            "0neCash",
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
            "Welcome",
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

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 20.0, right: _width / 12.0, top: _height / 15.0),
      child: Form(
          key: _key,
          child: Column(
            children: <Widget>[
              phoneTextFormField(),
              SizedBox(height: _height / 40.0),
              passwordTextFormField()
            ],
          )),
    );
  }

  Widget phoneTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.phone,
      textEditingController: phoneController,
      icon: Icons.phone_iphone,
      hint: "Phone Number",
    );
  }

  Widget passwordTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      textEditingController: passwordController,
      obscureText: true,
      icon: Icons.lock,
      hint: "Password",
    );
  }

  Widget forgetPassTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Forgot your password?",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: _large ? 14 : (_medium ? 12 : 10),
              fontFamily: 'JosefinSans',
            ),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              print("Routing");
            },
            child: Text(
              "Recover",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.red,
                fontFamily: 'JosefinSans',
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget openHome() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20.0, top: 40),
      child: Row(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              print('Route to Home Screen');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AppNav(),
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
                'Log In',
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
