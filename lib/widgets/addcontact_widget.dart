import 'package:flutter/material.dart';

class AddEntryDialog extends StatefulWidget {
  @override
  AddEntryDialogState createState() => new AddEntryDialogState();
}

class AddEntryDialogState extends State<AddEntryDialog> {
  bool _isButtonDisabled = true;
  _checkInputForConfirm(double phoneNumber) {
    if (phoneNumber > 0.0) {
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
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: new AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        brightness: Brightness.dark,
        backgroundColor: Colors.grey.shade100,
        title: const Text(
          'Add Contact',
          style: TextStyle(
            inherit: true,
            color: Colors.black,
            fontFamily: "worksans",
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
//        actions: [
//          new IconButton(
//            icon: Image.asset('assets/icons/save-file-option.png'),
//            padding: EdgeInsets.only(right: 23.0),
//            onPressed: () {
//              print('SAVE');
//            },
//            iconSize: 20,
//            color: Colors.white,
//          ),
//        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                autofocus: true,
                autocorrect: false,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.continueAction,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
                decoration: InputDecoration(
                  hintText: "Contact ID",
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                autofocus: true,
                autocorrect: false,
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.continueAction,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
                decoration: InputDecoration(
                  hintText: "Contact Name",
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                keyboardType: TextInputType.phone,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
                decoration: InputDecoration(
                  hintText: "Contact Number",
                ),
                onChanged: (text) {
                  _checkInputForConfirm(double.parse(text));
                },
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: FlatButton(
                  color: Colors.redAccent,
                  textColor: Colors.redAccent,
                  disabledColor: Colors.grey,
                  child: Text(
                    "Save",
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
            ],
          ),
        ),
      ),
    );
  }
}
