import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, left: 25, right: 15),
      //MediaQuery was used to dynamically get the top of different screens
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hey there!, what are you\n searching for ',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  //  fontFamily: 'RobotoMono'
                ),
              ),
              //\n blackslash takes the text to aother line
              Container(
                child: Image.asset('assets/icons/cart.png'),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: 'Search for Products',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                //In order to remove border lines
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Image.asset(
                    'assets/icons/search.png',
                    width: 10,
                  ),
                ),
                //prefixIcon makes one come before another
              ),
            ),
          ),
        ],
      ),
    );
  }
}
