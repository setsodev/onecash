import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:onecash/models/balance.dart';
import 'package:onecash/models/bank_card.dart';
import 'package:onecash/resources/database.dart' as db;
import 'package:onecash/widgets/drop_widget.dart';
import 'package:onecash/widgets/history_widget.dart';
import 'package:onecash/widgets/walletcard_widget.dart';

class WalletCardScreen extends StatefulWidget {
  final BankCard walletCard;
  final Color themeColor;
  const WalletCardScreen(this.walletCard,
      {Key key, this.themeColor = Colors.white})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _WalletCardScreenState();
}

class _WalletCardScreenState extends State<WalletCardScreen> {
  final Map<String, List<String>> timeValues = {
    "Day": ["Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"],
    "Month": [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "June",
      "July",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ],
    "Year": List.generate(21, (index) => "20${index + 1}").skip(18).toList()
  };
  String mainValue = "Year";
  int subIndex = 0;
  List<charts.Series<Balance, String>> series;
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
              Navigator.of(context).pop();
            }),
        title: Text(
          "Wallet ",
          style: TextStyle(inherit: true, color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            child: WalletCardWidget(
              widget.walletCard,
              collapsed: false,
              themeColor: widget.themeColor,
            ),
          ),
          DropWidget(
            timeValues,
            (mainValue, subIndex) {
              setState(() {
                if (this.mainValue != mainValue) this.mainValue = mainValue;
                if (this.subIndex != subIndex) this.subIndex = subIndex;
                series = db.getSeries(mainValue, subIndex, max: 1000);
              });
            },
            mainValue: mainValue,
          ),
          HistoryWidget(),
        ],
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
