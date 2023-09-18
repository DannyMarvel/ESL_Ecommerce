import 'package:esl_ecommerce/controllers/auth_controller.dart';
import 'package:esl_ecommerce/utils/show_snackBar.dart';
import 'package:flutter/material.dart';

import '../buyers/main_screen.dart';
import './register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // const LoginScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  final AuthController _authcontroller = AuthController();

  _signUp() {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          //PushReplacement eliminates the use of back Arrow & replace the previous screen with the new screen
          builder: (BuildContext context) {
        return RegisterScreen();
      }),
    );
  }

  _loginUsers() async {
    if (_formKey.currentState!.validate()) {
      String res = await _authcontroller.loginUsers(email, password);
      // return showSnack(context, 'logged In successfully');
      if (res == 'success') {
        //How to login and go to the MainScreen correctly
        return Navigator.pushReplacement(context, MaterialPageRoute(
          //PushReplacement eliminates the use of back Arrow & replace the previous screen with the new screen
          builder: (BuildContext context) {
            return MainScreen();
          },
        ));
      }
      //The we reload the login screen again
      else {
        return showSnack(context, res);
      }
    } else {
      return showSnack(context, 'Error 404, Abeg, fill it up');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login Customer\'s Account',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Pls enter a valid email';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter Email',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty && value.length < 8) {
                      return 'Pls enter a valid password';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter Password',
                  ),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                //Inkwell is also a type of button
                onTap: () {
                  _loginUsers();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade900,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(letterSpacing: 5, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Don\'t Have An Account?'),
                TextButton(
                  onPressed: () {
                    _signUp();
                  },
                  child: Text('Pls Sign Up'),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
