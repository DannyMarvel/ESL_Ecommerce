import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore __firestore = FirebaseFirestore.instance;

//How to pick image from our gallery
  pickProfileImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();

    XFile? _file = await _imagePicker.pickImage(source: source);

    //Now we want to know if a user has selected an Image
    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      return 'Pls select an Image';
    }
  }


  Future<String> signUpUsers(String email, String fullName, String phoneNumber,
      String password) async {
//create a var to store possible error
    String res = 'Some error ocurred';

    try {
      if (email.isNotEmpty &&
          email.endsWith('.com') &&
          fullName.isNotEmpty &&
          phoneNumber.isNotEmpty &&
          password.isNotEmpty) {
//Then we create the user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        await __firestore.collection('buyers').doc(cred.user!.uid).set({
          'email': email,
          'fullName': fullName,
          'phoneNumber': phoneNumber,
          'buyerId': cred.user!.uid,
          'address': '',
        });
        res = 'Successful';
      } else {
        res = 'Please fields must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  loginUsers(String email, String password) async {
//How to login a new user
    String res = 'something went wrong';

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
      } else {
        res = 'Pls fields must not be empty';
      }
    } catch (e) {
      //Now we convert extra errors to a string
      res = e.toString();
    }
    return res;
  }
}
