import 'package:flutter/material.dart';
import 'package:nt_homework/screens/country_screen.dart';
import 'package:nt_homework/screens/user_screen.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context){
                return  const UserScreen();
              }));
            }, child: const Text("Users Screen",style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),)),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(context){
                return  const CountryScreen();
              }));
            }, child: const Text("Country Screen",style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),)),
          ],
        ),
      ),
    );
  }
}
