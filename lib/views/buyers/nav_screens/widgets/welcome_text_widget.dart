
import "package:flutter/material.dart";


class WelocmeText extends StatelessWidget {
  const WelocmeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
  top: MediaQuery.of(context).padding.top, left:25,
 right: 15
 //This automatically gets the height of the user screen.
 //Ensure the const is removed       
      ),
      child: Row(
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
            child: Image.asset('assets/icons/cart.png',
            width: 30,),
          )
        ],
      ),
    );
  }
}

