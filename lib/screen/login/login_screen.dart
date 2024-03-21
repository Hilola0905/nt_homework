
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nt_homework/screen/login/widgets/exp_class.dart';
import 'package:nt_homework/screen/login/widgets/text_feiled_login.dart';
import 'package:nt_homework/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

import '../registor/registor_screen.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return AnnotatedRegion(

      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
                 // Image.asset("asset/images/img.png"),
                  const SizedBox(height: 20,),
                   TextFieldItem(
                      exp: AppValidates.emailExp,
                      hintText: "Email",
                      controller: emailController,
                      isPassword: false,
                      errorText: "is not Email",
                      iconPath: "asset/icons/email.svg",
                     onChanged: context.read<LoginViewModel>().updateEmail,
                  ),
                   const SizedBox(height: 20,),
                   TextFieldItem(
                      exp: AppValidates.passwordExp,
                      hintText: "Password",
                      controller:  passwordController,
                      isPassword: true,
                      errorText: "password is not true",
                      iconPath: "asset/icons/password.svg",
                     onChanged: context.read<LoginViewModel>().updatePassword,
                  ),
                   const SizedBox(height: 20,),
                   InkWell(
                    onTap :(){
                      context.read<LoginViewModel>().login(context);
                    },
                    child:
                    Container(

                      child: Text("login"),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
