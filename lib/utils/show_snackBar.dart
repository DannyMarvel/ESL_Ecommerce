import 'package:flutter/material.dart';

showSnack(context, String title) {
//Now we want to show a snackBar
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red.shade900,
      content: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  );
}
