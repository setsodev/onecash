import 'package:flutter/material.dart';
import 'package:onecash/screens/home/send/bank_widget.dart';
import 'package:onecash/screens/home/send/send_catergories.dart';

class BankScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {
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
                builder: (context) => SendOption(),
              ),
            );
          },
        ),
        title: Text(
          "Bank Transfers",
          style: TextStyle(
            inherit: true,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 40,
              child: Theme(
                data: ThemeData(
                    primaryColor: Colors.grey.shade50,
                    primaryColorDark: Colors.grey.shade50),
                child: TextFormField(
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    fillColor: Colors.grey.shade50,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide:
                          BorderSide(color: Colors.grey.shade50, width: 0.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide:
                          BorderSide(color: Colors.grey.shade50, width: 0.0),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                    hintText: "Search Bank ",
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Divider(
              height: 0.1,
              color: Color.fromRGBO(0, 0, 0, 0.3),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                left: 20.0,
                top: 20.0,
              ),
              child: Text(
                'Recent',
                style: TextStyle(
                  fontFamily: "worksans",
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  leading: Container(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/images/bank.png'),
                    ),
                  ),
                  title: Text(
                    'Universal Merchant Bank',
                    style: TextStyle(
                      fontFamily: "worksans",
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BankAccount(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Container(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/images/bank.png'),
                    ),
                  ),
                  title: Text(
                    'Access Bank',
                    style: TextStyle(
                      fontFamily: "worksans",
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BankAccount(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Container(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/images/bank.png'),
                    ),
                  ),
                  title: Text(
                    'Fidelity Bank',
                    style: TextStyle(
                      fontFamily: "worksans",
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BankAccount(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: Container(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/images/bank.png'),
                    ),
                  ),
                  title: Text(
                    'Guaranty Trust Bank',
                    style: TextStyle(
                      fontFamily: "worksans",
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BankAccount(),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("New Bank");
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
