import 'package:esl_ecommerce/views/buyers/nav_screens/account_screen.dart';
import 'package:esl_ecommerce/views/buyers/nav_screens/cart_screen.dart';
import 'package:esl_ecommerce/views/buyers/nav_screens/category_screen.dart';
import 'package:esl_ecommerce/views/buyers/nav_screens/home_screens.dart';
import 'package:esl_ecommerce/views/buyers/nav_screens/search_screens.dart';
import 'package:esl_ecommerce/views/buyers/nav_screens/store_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;

  List<Widget> _pages = [
    HomeScreen(),
    CategoryScreen(),
    StoreScreen(),
    CartScreen(),
    SearchScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _pageIndex,
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.yellow.shade100,
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'HOME',
              backgroundColor: Colors.yellow.shade700),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/Explore.png',
                width: 20,
              ),
              //icon: Icon(CupertinoIcons.home),
              label: 'CATEGORIES'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/shopping.png',
                width: 20,
              ),
              label: 'STORE'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/cart.png',
                width: 20,
              ),
              label: 'CART'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/search.png',
                width: 20,
              ),
              label: 'SEARCH'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/account.png',
                width: 20,
              ),
              label: 'ACCOUNT'),
        ],
      ),
      body: _pages[_pageIndex],
    );
  }
}
