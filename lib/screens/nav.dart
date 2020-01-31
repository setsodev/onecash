import 'package:flutter/material.dart';
import 'package:onecash/screens/home/home.dart';
import 'package:onecash/screens/management/management.dart';
import 'package:onecash/screens/profile/profile.dart';
import 'package:onecash/screens/wallet/wallet.dart';

class AppNav extends StatefulWidget {
  @override
  _AppNavState createState() => _AppNavState();
}

class _AppNavState extends State<AppNav> {
  int index = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: ClipOval(
          child: Container(
            color: index == 0 ? Colors.redAccent : Colors.grey,
            child: Image.asset(
              "assets/icons/icon_home.png",
              fit: BoxFit.scaleDown,
              width: 35.0,
              height: 35.0,
            ),
          ),
        ),
        title: Text(
          'Home',
          style: TextStyle(fontFamily: "worksans"),
        ),
      ),
      BottomNavigationBarItem(
          icon: ClipOval(
            child: Container(
              color: index == 1 ? Colors.redAccent : Colors.grey,
              child: Image.asset(
                "assets/icons/icon_management.png",
                fit: BoxFit.scaleDown,
                width: 35.0,
                height: 35.0,
              ),
            ),
          ),
          title: Text(
            'Management',
            style: TextStyle(fontFamily: "worksans"),
          )),
      BottomNavigationBarItem(
        icon: ClipOval(
          child: Container(
            color: index == 2 ? Colors.redAccent : Colors.grey,
            child: Image.asset(
              "assets/icons/icon_wallet.png",
              fit: BoxFit.scaleDown,
              width: 35.0,
              height: 35.0,
            ),
          ),
        ),
        title: Text(
          'Wallet',
          style: TextStyle(fontFamily: "worksans"),
        ),
      ),
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        HomeScreen(),
        ManagementScreen(),
        WalletScreen(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      this.index = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      this.index = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.grey.shade200,
          // appBar: _mainAppBar(),
          body: buildPageView(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (int index) {
              bottomTapped(index);
            },
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            elevation: 4,
            items: buildBottomNavBarItems(),
          ),
        )
      ],
    );
  }

  AppBar _mainAppBar() {
    return AppBar(
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
    );
  }
}
