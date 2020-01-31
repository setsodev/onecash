import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:onecash/models/bank_card.dart';
import 'package:onecash/resources/database.dart' as db;
import 'package:onecash/screens/home/cashout/cashout.dart';
import 'package:onecash/screens/home/deposit/deposit.dart';
import 'package:onecash/screens/home/send/send_catergories.dart';
import 'package:onecash/screens/home/wallet_card.dart';
import 'package:onecash/screens/profile/profile.dart';
import 'package:onecash/widgets/walletcard_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.black),
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "O",
          style: TextStyle(
              inherit: true,
              color: Colors.black,
              fontFamily: "worksans",
              fontWeight: FontWeight.bold,
              fontSize: 40.0,
              decorationColor: Colors.black,
              decorationStyle: TextDecorationStyle.solid),
        ),
        // centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/icons/qr-code.png'),
            onPressed: () {
              print('QR CODE');
            },
            iconSize: 10,
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              print('Profile');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
            iconSize: 38,
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          _buildWalletCards(),
          servicesMainRow(),
          otherServices(),
        ],
      ),
    );
  }

  Widget _buildWalletCards() {
    var walletCards = db.getBankCards();
    return Container(
      height: 250.0,
      margin: EdgeInsets.only(left: 4.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          BankCard creditCard = walletCards[index];
          Color color =
              index % 2 == 0 ? Colors.red : Theme.of(context).primaryColor;

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => WalletCardScreen(
                            creditCard,
                            themeColor: color,
                          )));
                },
                child: WalletCardWidget(
                  creditCard,
                  collapsed: true,
                  themeColor: color,
                )),
          );
        },
        itemCount: walletCards.length,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget servicesMainRow() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 15),
            width: 110.0,
            height: 100.0,
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              elevation: 10.0,
              shadowColor: Colors.white70,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SendOption(),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      Ionicons.ios_wallet,
                      color: Colors.black,
                      size: 48.0,
                    ),
                    Text(
                      'Send',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 15),
            width: 110.0,
            height: 100.0,
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              elevation: 10.0,
              shadowColor: Colors.white70,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CashOutScreen(),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      Entypo.wallet,
                      color: Colors.black,
                      size: 48.0,
                    ),
                    Text(
                      'Cash Out',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 110.0,
            height: 100.0,
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              elevation: 10.0,
              shadowColor: Colors.white70,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DepositScreen(),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(
                      Ionicons.md_archive,
                      color: Colors.black,
                      size: 48.0,
                    ),
                    Text(
                      'Deposit',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget otherServices() {
    return Container(
      margin: EdgeInsets.only(
        top: 40.0,
        left: 20.0,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    child: Material(
                      borderRadius: BorderRadius.circular(12.0),
                      elevation: 34.0,
                      shadowColor: Colors.white70,
                      child: MaterialButton(
                        onPressed: () {
                          print('Airtime Top Up');
                        },
                        child: Icon(
                          Ionicons.ios_phone_portrait,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 12.0),
                    child: Text(
                      'Airtime Top Up',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    child: Material(
                      borderRadius: BorderRadius.circular(12.0),
                      elevation: 34.0,
                      shadowColor: Colors.white70,
                      child: MaterialButton(
                        onPressed: () {
                          print('Bill Payment');
                        },
                        child: Icon(
                          Ionicons.ios_card,
                          color: Colors.black,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Bill Payment',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    child: Material(
                      borderRadius: BorderRadius.circular(12.0),
                      elevation: 34.0,
                      shadowColor: Colors.white70,
                      child: MaterialButton(
                        onPressed: () {
                          print('Get Loan');
                        },
                        child: Icon(
                          Ionicons.ios_cash,
                          color: Colors.black,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 55.0),
                    child: Text(
                      'Get Loan',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    child: Material(
                      borderRadius: BorderRadius.circular(12.0),
                      elevation: 34.0,
                      shadowColor: Colors.white70,
                      child: MaterialButton(
                        onPressed: () {
                          print('Crowdfunding');
                        },
                        child: Icon(
                          Ionicons.ios_people,
                          color: Colors.black,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Crowdfunding',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 25),
          Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    child: Material(
                      borderRadius: BorderRadius.circular(12.0),
                      elevation: 34.0,
                      shadowColor: Colors.white70,
                      child: MaterialButton(
                        onPressed: () {
                          print('Ticketing');
                        },
                        child: Icon(
                          Ionicons.ios_today,
                          color: Colors.black,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 50.0),
                    child: Text(
                      'Ticketing',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 60,
                    width: 60,
                    child: Material(
                      borderRadius: BorderRadius.circular(12.0),
                      elevation: 34.0,
                      shadowColor: Colors.white70,
                      child: MaterialButton(
                        onPressed: () {
                          print('Delivery');
                        },
                        child: Icon(
                          Ionicons.ios_archive,
                          color: Colors.black,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Delivery',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
