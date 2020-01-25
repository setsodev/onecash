import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onecash/screens/send/transfer.dart';

class BankAccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BankAccountState();
}

class _BankAccountState extends State<BankAccount> {
  bool _isButtonDisabled = true;
  _checkInputForConfirm(double accountNumber) {
    if (accountNumber > 0.0) {
      setState(() {
        _isButtonDisabled = false;
      });
    } else {
      setState(() {
        _isButtonDisabled = true;
      });
    }
  }

  _startSave() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BankTransfer(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
          iconSize: 30,
        ),
        title: Text(
          'Bank Transfer',
          style: TextStyle(
            inherit: true,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
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
                  backgroundImage: AssetImage('assets/images/bank.png'),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Account Details',
                style: TextStyle(
                  fontFamily: "worksans",
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 45),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: TextField(
                  autocorrect: false,
//                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.continueAction,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Bank Account Number',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: "worksans",
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                    hintText: "Enter recipient's bank account number",
                    hintStyle: TextStyle(fontSize: 20),
                  ),
                  onChanged: (text) {
                    _checkInputForConfirm(double.parse(text));
                  },
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: TextField(
                  autocorrect: false,
//                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.words,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Account Name',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: "worksans",
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                    hintText: "Enter Full Legal Name of Account Holder",
                    hintStyle: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: FlatButton(
                    color: Colors.redAccent,
                    textColor: Colors.redAccent,
                    disabledColor: Colors.grey,
                    child: Text(
                      "Next",
                      style: TextStyle(
                          fontFamily: "worksans",
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    // onPressed: null,
                    onPressed: _isButtonDisabled ? null : () => _startSave(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
