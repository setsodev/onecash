import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:onecash/models/balance.dart';
import 'package:onecash/models/bank_card.dart';
import 'package:onecash/models/payment.dart';

List<BankCard> getBankCards() {
  List<BankCard> bankCards = [];
  bankCards.add(BankCard(
      "4616900007729988",
      "https://res.cloudinary.com/dgwcexlws/image/upload/v1575035253/fourjay.org-visa-mastercard-logo-png-471054_ghspjp.png",
      "Wallet Account",
      "06/23",
      "192"));
  return bankCards;
}

List<Payment> getPayments() {
  List<Payment> payments = [];
  payments.add(Payment(
      "https://www.iosicongallery.com/icons/netflix-2018-11-01/512.png",
      "Netflix",
      "Entertainment",
      "12 Mar 2019",
      400.0,
      -1));
  payments.add(Payment(
      "https://seeklogo.com/images/C/Coca-Cola-logo-108E6559A3-seeklogo.com.png",
      "Coca Cola",
      "Food and Snacks",
      "12 Mar 2019",
      175.0,
      -1));
  payments.add(Payment(
      "https://cdn-images-1.medium.com/fit/c/200/200/1*n8a5ynNw0XqBlgwugpFrtg.png",
      "Swiggy",
      "Food and Snacks",
      "12 Mar 2019",
      368.0,
      -1));
  payments.add(Payment(
      "https://i.pinimg.com/originals/f7/64/15/f76415d3d9779400d610a0f089f551e5.jpg",
      "Coursera",
      "Swiggy",
      "12 Mar 2019",
      250.0,
      -1));
  payments.add(Payment(
      "https://seeklogo.com/images/S/shoprite-logo-D4188C42D2-seeklogo.com.png",
      "Shoprite",
      "Meat",
      "12 Mar 2019",
      250.0,
      -1));
  return payments;
}

List<charts.Series<Balance, String>> _getSeries(
    List<String> timeValues, int max) {
  Random rnd = Random();
  var incomeData = timeValues
      .map((value) => Balance(value, rnd.nextInt(max).toDouble()))
      .toList();
  var expenditureData = timeValues
      .map((value) => Balance(value, rnd.nextInt(max).toDouble()))
      .toList();
  return [
    charts.Series<Balance, String>(
      id: 'Income',
      domainFn: (Balance sales, _) => sales.time,
      measureFn: (Balance sales, _) => sales.money,
      data: incomeData,
    ),
    charts.Series<Balance, String>(
        id: "Expenditure",
        domainFn: (Balance balance, _) => balance.time,
        measureFn: (Balance balance, _) => balance.money,
        data: expenditureData)
  ];
}

List<charts.Series<Balance, String>> getSeries(String key, int index,
    {int max = 1000}) {
  var months = [
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
  ];
  var days = List.generate(
      24, (index) => index < 9 ? "0${index + 1}" : "${index + 1}");
  var years = ["2017", "2018", "2019"];
  var hours = List.generate(24, (index) => "${index + 1}hr");
  var mainMap = {"Year": "Month", "Month": "Day", "Day": "Hour"};
  var subMap = {"Hour": hours, "Day": days, "Month": months, "Year": years};
  var subKey = mainMap[key];
  print("Called");
  return _getSeries(subMap[subKey], max);
}
