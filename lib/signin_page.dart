import 'dart:developer';
import 'package:authentication/EmailLogin/authentication_widget.dart';
import 'package:flutter/material.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: AuthenticationWidget(
                shouldEmailAuthentication: true,
                scaffoldbackGroundColor: Colors.white,
                onPhoneLoginPressed: (phoneNumber) {
                  log(phoneNumber);
                },
                onEmailLoginPressed: (userEmail, userPassword) {
                  log(userEmail);
                  log(userPassword);
                },
                phoneAuthentication: false,
                // cardLeftPadding: 300,
                // cardRightPadding: 300,
                isSignUpVisible: true,
                buttonColor: Colors.lightBlueAccent,
                isImageVisible: false,
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
