import 'package:flutter/material.dart';
import 'package:onecash/models/textformfield.dart';
import 'package:onecash/screens/home/home.dart';
import 'package:onecash/screens/register/verify.dart';
import 'package:onecash/widgets/responsive_widget.dart';

class FormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FormPage(),
      ),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController textController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController datetimeController = TextEditingController();
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
            welcomeTextRow(),
            descTextRow(),
            profileForm(),
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
                  builder: (context) => VerifyScreen(),
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
      margin: EdgeInsets.only(left: _width / 20, top: 50),
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
      margin: EdgeInsets.only(left: _width / 20, top: 80, bottom: 20),
      child: Row(
        children: <Widget>[
          Text(
            "Profile Details",
            style: TextStyle(
              color: Colors.black,
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
              "To continue with your wallet, you need to complete this profile details ",
              style: TextStyle(
                color: Colors.grey[800],
                fontFamily: 'JosefinSans',
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileForm() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 20.0, right: _width / 12.0, top: _height / 15.0),
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            firstNameTextFormField(),
            SizedBox(height: _height / 40.0),
            lastNameTextFormField(),
            SizedBox(height: _height / 40.0),
            emailTextFormField(),
            SizedBox(height: _height / 40.0),
            passwordTextFormField(),
            SizedBox(height: _height / 40.0),
            confirmPasswordTextFormField(),
            termsAndConditionRow(),
          ],
        ),
      ),
    );
  }

  Widget firstNameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      textEditingController: textController,
      icon: Icons.person,
      hint: "First Name",
    );
  }

  Widget lastNameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      textEditingController: textController,
      icon: Icons.person,
      hint: "Last Name",
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      textEditingController: emailController,
      icon: Icons.email,
      hint: "Email",
    );
  }

  Widget passwordTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      textEditingController: textController,
      obscureText: true,
      icon: Icons.lock,
      hint: "Password",
    );
  }

  Widget confirmPasswordTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      textEditingController: textController,
      obscureText: true,
      icon: Icons.lock,
      hint: " Confirm Password",
    );
  }

  Widget continueButton() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20.0, top: 40),
      child: Row(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              print("Route to HomeScreen");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
            textColor: Colors.white,
            padding: EdgeInsets.all(0.0),
            child: Container(
              alignment: Alignment.center,
              width: 360,
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

  Widget termsAndConditionRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "By continuing, you agree to our Privacy and Term of Service",
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.w600,
              fontSize: _large ? 14 : (_medium ? 12 : 10),
              fontFamily: 'JosefinSans',
            ),
          ),
        ],
      ),
    );
  }
}
