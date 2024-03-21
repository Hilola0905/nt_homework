

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nt_homework/screen/registor/registor_screen.dart';

class LoginViewModel extends ChangeNotifier{
  String email="";
  String password="";

  updateEmail(String v){
    email=v;
  }
  updatePassword(String v){
    password=v;
  }
  login( BuildContext context) async{
    try {
      final credantial=
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      if(credantial.user!.uid.isNotEmpty){
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
          return RegistorScreen();
        }));
      }


    } on FirebaseAuthException catch (e){
      if(e.code=="weak-password"){
        print("weak");
      } else if(e.code=='email-already-in-use'){
        print("exist");
      }
    } catch(e){
      print(e);
    }
    }

}