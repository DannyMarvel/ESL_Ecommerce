import 'package:esl_ecommerce/views/buyers/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   //SystemChrome.setSystemUIOverlayStyle(),   
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: "RobotoMono"
      ),
      home: MainScreen(),
    );
  }
}

