import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nt_homework/data/model/user_model.dart';

import '../view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: context.watch<UserViewModel>().isLoading ?
      const Center(child: CircularProgressIndicator()) :
      RefreshIndicator(
        onRefresh: (){
          return Future<void>.delayed(
              const Duration(seconds: 2),
                  (){
                context.read<UserViewModel>().fetchUsers();
              }
          );
        },
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                ...List.generate(
                  context.watch<UserViewModel>().users.length,
                      (index) {
                    UserModel user= context.watch<UserViewModel>().users[index];
                    return Container(
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(16,16)
                          )
                        ]
                      ),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 8,
                              child: ClipRRect(
                                borderRadius:  BorderRadius.circular(18),
                                  child: Image.network(user.avatarUrl,fit: BoxFit.cover,))),
                          Expanded (
                            flex: 2,
                            child: Text(user.userName,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black
                            ),),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
           Future<void>.delayed(
              const Duration(seconds: 2),
                  (){
                context.read<UserViewModel>().fetchUsers();
              }
          );
        },
        child: Icon(Icons.get_app),
      ),
    );
  }
}
