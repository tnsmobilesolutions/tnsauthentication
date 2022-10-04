// ignore_for_file: prefer_const_constructors

import 'dart:developer';



import 'package:authentication/EmailLogin/authenticationWidget.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController PhoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellowAccent,
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: AuthenticationWidget(
                scaffoldbackGroundColor: Colors.white70,
                onPhoneLoginPressed: (phoneNumber) {
                  log(phoneNumber);
                },
                onEmailLoginPressed: (userEmail, userPassword) {
                  log(userEmail);
                  log(userPassword);
                },
                phoneAuthentication: true,
                isSignUpVisible: true,
              )

              //     PhoneSignIn(
              //   onLoginPressed: (phoneNumber) => log(phoneNumber),
              // ),
              ),
        ),
      ),
    );
  }
}
