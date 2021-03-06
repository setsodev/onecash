import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:onecash/models/send_model.dart';
import 'package:onecash/screens/nav.dart';

class DepositScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen>
    with SingleTickerProviderStateMixin {
  String amountValue = '0.00';
  bool showButtonNext = false;
  bool showPageLoader = false;
  bool showSpinner = false;
  bool showChecked = false;
  AnimationController animationController;

  _depositSuccessful() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DepositScreen(),
      ),
    );
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    animationController.addListener(() {
      if (animationController.status.toString() ==
          'AnimationStatus.completed') {
        setState(() {
          showSpinner = false;
          showChecked = true;
        });
        Timer(
          Duration(seconds: 1),
          () => setState(() {
            showPageLoader = false;
            _depositSuccessful();
          }),
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _startDeposit() {
    setState(() {
      showPageLoader = true;
      showSpinner = true;
      animationController.forward();
    });
  }

  // final _formKey = GlobalKey<FormState>();
  Widget _showPageLoader() {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaY: 10,
              sigmaX: 10,
            ),
            child: Container(
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        ),
        showSpinner
            ? Align(
                alignment: Alignment.center,
                child: Image.asset('assets/images/one_cash.png', height: 35),
              )
            : Container(),
        showSpinner
            ? Align(
                alignment: Alignment.center,
                child: RotationTransition(
                  turns:
                      Tween(begin: 0.0, end: 2.0).animate(animationController),
                  child: Image.asset('assets/images/loading.png'),
                ),
              )
            : Container(),
        showChecked
            ? Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/images/checked.png'),
                    SizedBox(height: 25),
                    Material(
                      child: Text(
                        'Deposit Successful',
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        width: 150,
        child: Stack(
          children: <Widget>[
            Scaffold(
              backgroundColor: Colors.grey.shade200,
              appBar: AppBar(
                automaticallyImplyLeading: true,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppNav(),
                      ),
                    );
                  },
                ),
                title: Text(
                  'Deposit',
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 150,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage('assets/images/user.png'),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontFamily: "worksans",
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 25,
                        child: FlatButton(
                          color: Colors.redAccent,
                          textColor: Colors.white,
                          child: Text(
                            "OneCash Card",
                            style: TextStyle(
                                fontFamily: "worksans",
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Amount',
                                  style: TextStyle(
                                      fontFamily: "worksans", fontSize: 17),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'GHS',
                                      style: TextStyle(
                                          fontFamily: "worksans",
                                          fontSize: 12,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(width: 5),
                                    InkWell(
                                      child: Text(
                                        this.amountValue,
                                        style: TextStyle(
                                            fontFamily: "worksans",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      onTap: () async {
                                        var navigationResult =
                                            await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SendModel(),
                                            fullscreenDialog: true,
                                          ),
                                        );
                                        setState(() {
                                          this.amountValue =
                                              navigationResult.toString();
                                          if (navigationResult.toString() !=
                                              '0.0') {
                                            this.showButtonNext = true;
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Divider(height: 0.1, color: Colors.grey),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Transaction fees',
                                  style: TextStyle(
                                      fontFamily: "worksans", fontSize: 17),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'GHS',
                                      style: TextStyle(
                                          fontFamily: "worksans",
                                          fontSize: 12,
                                          color: Colors.grey),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Free',
                                      style: TextStyle(
                                          fontFamily: "worksans",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Divider(height: 0.1, color: Colors.grey),
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/airtel.png',
                                  height: 30.0,
                                  fit: BoxFit.fitHeight,
                                ),
                                Spacer(flex: 1),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'AirtelTigo',
                                      style: TextStyle(
                                          fontFamily: "worksans",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '026****0000',
                                      style: TextStyle(
                                          fontFamily: "worksans",
                                          fontSize: 12,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Spacer(flex: 5),
                                IconButton(
                                  icon: Icon(Icons.add,
                                      color: Colors.grey, size: 35),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
//                                        barrierDismissible: true,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: Form(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'Select Source Fund',
                                                    style: TextStyle(
                                                      fontFamily: "worksans",
                                                      fontSize: 17,
                                                      color: Colors.redAccent,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: FlatButton(
                                                      child: Text(
                                                        'MoMo Account',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        print('MoMo Account');
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: FlatButton(
                                                      child: Text(
                                                        'Bank Account',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        print('Bank Account');
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: FlatButton.icon(
                                                      onPressed: () {
                                                        print(
                                                            'Add New Account');
                                                      },
                                                      icon: Icon(
                                                        Icons.add,
                                                        color: Colors.grey,
                                                      ),
                                                      label: Text(
                                                        'Add Source Fund',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 1),
                            Divider(height: 0.1, color: Colors.grey),
                            SizedBox(height: 50),
                            Opacity(
                              opacity: this.showButtonNext ? 1.0 : 0.0,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 40,
                                child: FlatButton(
                                  color: Colors.redAccent,
                                  textColor: Colors.redAccent,
                                  disabledColor: Colors.grey,
                                  child: Text(
                                    'Send Now',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "worksans",
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () => _startDeposit(),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            showPageLoader ? _showPageLoader() : Container(),
          ],
        ),
      ),
    );
  }
}
