import 'dart:typed_data';

import 'package:esl_ecommerce/controllers/auth_controller.dart';
import 'package:esl_ecommerce/utils/show_snackBar.dart';
import 'package:esl_ecommerce/views/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //const RegisterScreen({super.key});
  final AuthController _authController = AuthController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  late String email;

  late String fullName;

  late String phoneNumber;

  late String password;
  //How to create a circular progress indicator for login
  bool _isLoading = false;
  Uint8List? _image;

  _signUpUser() async {
    //Now we update the setState to true
    setState(() {
      _isLoading = true;
    });
    if (_formkey.currentState!.validate()) {
      String res = await _authController
          .signUpUsers(email, fullName, phoneNumber, password)
          .whenComplete(
        () {
          setState(() {
            //Then we can reset the login page
            _formkey.currentState!.reset();
            _isLoading = false;
          });
        },
      );
      return showSnack(
          context, 'Congratulations Your Account has been Created');
    }
    // if (res != 'success') {
    //   print(res);}
    else {
      //If the field is empty, then setState isLoading to false
      setState(() {
        _isLoading = false;
      });
      //Must be in a stateful widget
      return showSnack(context, 'Error 007,Try Again');
    }
  }

  //Then how we can select the image source
  selectGalleryImage() async {
    Uint8List im = await _authController.pickProfileImage(ImageSource.gallery);

    setState(() {
      _image = im;
    });
  }

  selectCameraImage() async {
    Uint8List im = await _authController.pickProfileImage(ImageSource.camera);

    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create a Customer\'s Account',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundColor: Colors.yellow.shade900,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : CircleAvatar(
                            radius: 64,
                            backgroundColor: Colors.yellow.shade900,
                            //  backgroundImage: NetworkImage(''),
                          ),
//Positioned refers to how the next widget will be placed on the CircleAvatar
                    Positioned(
                      right: 0,
                      bottom: 5,
                      child: IconButton(
                        onPressed: () {
                          selectGalleryImage();
                        },
                        icon: Icon(
                          Icons.photo_camera,
                          // color: Colors.white,
                        ),
                      ),
                    ),
                  ],
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
                      if (value!.isEmpty) {
                        return 'Pls enter your fullName';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      fullName = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter Full Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Pls enter a valid phone Number';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      phoneNumber = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter ya phone Number',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: TextFormField(
                    //How to hide password
                    obscureText: true,
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
                      labelText: 'Enter ya Password',
                    ),
                  ),
                ),
                //Now wrap container with GestureDetector
                GestureDetector(
                  onTap: () {
                    _signUpUser();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade900,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: _isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                    ),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('Already Have An Account?'),
                  TextButton(
                    onPressed: () {
                      //How to move to a new screen, NOTE THIS!!!
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                    child: Text('Login'),
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
