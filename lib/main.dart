import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nt_homework/firebase_options.dart';
import 'package:nt_homework/screen/calculator_screen.dart';
import 'package:nt_homework/screen/login/login_screen.dart';
import 'package:nt_homework/view_model/calculator_view_model.dart';
import 'package:nt_homework/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

Future<void> main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options : DefaultFirebaseOptions.currentPlatform
  );
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) =>LoginViewModel()
          )
        ],
    child:    const MyApp(),
    )

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}


