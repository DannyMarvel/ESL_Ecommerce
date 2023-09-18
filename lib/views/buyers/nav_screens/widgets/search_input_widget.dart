
import 'package:flutter/material.dart';

class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: ClipRRect(
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
    );
  }
}
