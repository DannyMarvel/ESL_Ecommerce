import 'package:esl_ecommerce/firebase_options.dart';
import 'package:esl_ecommerce/views/buyers/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './views/auth/register_screen.dart';
import './views/auth/login_screen.dart';
import 'views/buyers/nav_screens/home_screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "RobotoMono"),
      home: RegisterScreen(),
    );
  }
}
