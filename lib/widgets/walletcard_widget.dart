import 'package:flutter/material.dart';
import 'package:onecash/models/bank_card.dart';

class WalletCardWidget extends StatelessWidget {
  final BankCard _card;
  final Color themeColor;
  final bool collapsed;
  const WalletCardWidget(
    this._card, {
    Key key,
    this.themeColor = Colors.white,
    this.collapsed = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return !collapsed ? _buildExpanded(context) : _buildCollapsed(context);
  }

  Widget _buildExpanded(BuildContext context) {
    BankCard card = _card;
    double rowWidth = MediaQuery.of(context).size.width * 2 / 3;
    Color color = themeColor == Colors.white ? Colors.black : Colors.white;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 24.0),
      decoration: BoxDecoration(
        color: themeColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 200.0,
              spreadRadius: 0.1,
              offset: Offset(0.0, 10.0)),
          BoxShadow(color: Colors.white, blurRadius: 300.0, spreadRadius: 10.5)
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Available Balance",
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(fontSize: 16.0, color: color),
              ),
              Image.network(
                card.logo,
                height: 18.0,
                fit: BoxFit.fitHeight,
//                color: themeColor == Colors.white ? null : Colors.white,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              "GH₵34,458,955",
              style: Theme.of(context).textTheme.headline.copyWith(
                  color: color, fontWeight: FontWeight.bold, fontSize: 28.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              card.cardNo,
              style: Theme.of(context).textTheme.headline.copyWith(
                  color: color.withOpacity(0.3), fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4.0),
            width: rowWidth,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "One Cash Wallet",
                  style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
                Text(
                  card.expiryDate,
                  style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCollapsed(BuildContext context) {
    BankCard card = _card;
    Color color = themeColor == Colors.white ? Colors.black : Colors.white;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 24.0),
          decoration: BoxDecoration(
            color: themeColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 12.0,
                ),
                child: Text(
                  "John Doe",
                  style: Theme.of(context).textTheme.headline.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0),
                ),
              ),
              Text(
                "OneCash Wallet",
                style: TextStyle(
                    color: color, fontWeight: FontWeight.w400, fontSize: 18.0),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                  card.cardNo,
                  style: Theme.of(context).textTheme.title.copyWith(
                      color: color.withOpacity(0.3),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.network(
                      card.logo,
                      height: 18.0,
                      fit: BoxFit.fitHeight,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 250.0),
                      child: Text(
                        card.expiryDate,
                        style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w400,
                            fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
