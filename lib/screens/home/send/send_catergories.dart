import 'package:flutter/material.dart';
import 'package:onecash/screens/home/home.dart';
import 'package:onecash/screens/home/send/bank.dart';
import 'package:onecash/screens/home/send/send.dart';

class SendOption extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SendOptionState();
}

class _SendOptionState extends State<SendOption> {
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
          iconSize: 30,
        ),
        title: Text(
          "OneCash",
          style: TextStyle(
            inherit: true,
            color: Colors.black,
            fontSize: 24,
            fontFamily: "worksans",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          labelQuestion(),
          optionPaymentMoMo(),
          optionPayment(),
        ],
      ),
    );
  }

  Widget labelQuestion() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      alignment: Alignment.center,
      child: Text(
        'Where would you like to send funds to?',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget optionPaymentMoMo() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 70),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 15),
            width: 110.0,
            height: 120.0,
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              elevation: 10.0,
              shadowColor: Colors.white70,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SendScreen(),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/mtn.jpg'),
                        ),
                      ),
                    ),
                    Text(
                      'MTN',
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
            height: 120.0,
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              elevation: 10.0,
              shadowColor: Colors.white70,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SendScreen(),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/vodafone.png'),
                        ),
                      ),
                    ),
                    Text(
                      'Vodafone',
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
            height: 120.0,
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              elevation: 10.0,
              shadowColor: Colors.white70,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SendScreen(),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/airteltigo.jpg'),
                        ),
                      ),
                    ),
                    Text(
                      'AirtelTigo',
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

  Widget optionPayment() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 40),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 15),
            width: 110.0,
            height: 120.0,
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              elevation: 10.0,
              shadowColor: Colors.white70,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BankScreen(),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/bank.png'),
                        ),
                      ),
                    ),
                    Text(
                      'Bank',
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
            height: 120.0,
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              elevation: 10.0,
              shadowColor: Colors.white70,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SendScreen(),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/OneCash.png'),
                        ),
                      ),
                    ),
                    Text(
                      'OneCash',
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
}
