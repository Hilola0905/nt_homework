import 'package:flutter/material.dart';
import 'package:nt_homework/data/repository/country_repository.dart';
import 'package:nt_homework/screens/task_screen.dart';
import 'package:nt_homework/view_model/country_view_model.dart';
import 'package:nt_homework/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'data/network/api_provider.dart';
import 'data/repository/user_repository.dart';

void main() {
  ApiProvider apiProvider = ApiProvider();
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => UserViewModel(
                userRepository: UserRepository(apiProvider: apiProvider),
              ),
            ),

            ChangeNotifierProvider(
                create: (_) => CountryViewModel(
                    countryRepository: CountryRepository(apiProvider: apiProvider)
                )
            ),
          ],

          child:  const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TaskScreen(),
    );
  }
}
