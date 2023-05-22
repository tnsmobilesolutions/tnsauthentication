// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:authentication/EmailLogin/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// typedef UserModelParamCallback = Function(String? email, String? password,
//     String? name, String? userId, String? mobile);
typedef EmailVerificationCallBack = Function(String? email, String? password);
typedef EmailBackButtonCallBack = Function();

class EmailVerification extends StatefulWidget {
  EmailVerification({
    Key? key,
    this.onSignUpPressed,
    this.onVerifyPressed,
    required this.shouldEmailAuthentication,
    this.additionalWidget,
    this.buttonColor,
    this.needConfirmPasswordinSignup,
    this.signUpButtonText,
    this.signupAppBarText,
    this.onBackPressed,
  }) : super(key: key);
  final UserModelParamCallback? onSignUpPressed;
  final EmailBackButtonCallBack? onBackPressed;
  final EmailVerificationCallBack? onVerifyPressed;
  bool shouldEmailAuthentication;
  Widget? additionalWidget;
  String? signUpButtonText;
  Color? buttonColor;
  String? signupAppBarText;
  bool? needConfirmPasswordinSignup;
  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('Verification'),
          leading: IconButton(
            onPressed: () {
              widget.onBackPressed != null ? widget.onBackPressed!() : null;
            },
            icon: Icon(
              Icons.arrow_back_rounded,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
              key: _formkey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: totalWidth / 2.5,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        onSaved: (newValue) => emailController,
                        validator: (value) {
                          // Returns true if email address is in use.

                          if (value == null || value.isEmpty) {
                            return ("Please enter Your Email");
                          }
                          // reg expression for email validation
                          else if (!(RegExp(
                                  r"^[a-zA-Z0-9.]+@[a-zA-Z]+\.[a-zA-Z]+"))
                              .hasMatch(value)) {
                            return ("Please enter a valid email");
                          }
                          //else if () {}
                          return null;
                        },
                        decoration: const InputDecoration(
                            icon: Icon(Icons.email),
                            hintText: 'Enter Your Email',
                            hintStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            fillColor: Colors.grey,
                            focusColor: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: totalWidth / 2.5,
                      child: TextFormField(
                        obscureText: isPasswordVisible,
                        controller: passwordController,
                        onSaved: (newValue) => passwordController,
                        validator: (value) {
                          RegExp regex = RegExp(r'^.{6,}$');
                          if (value == null || value.isEmpty) {
                            return ("Password length must be atleast 6 characters");
                          }
                          if (!regex.hasMatch(value)) {
                            return ("Enter Valid Password (min 6 character)");
                          } else if (value.length < 6) {
                            return 'Password length must be atleast 6 characters';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.blue,
                              ),
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                            ),
                            icon: Icon(Icons.password),
                            hintText: 'Enter Password',
                            hintStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            fillColor: Colors.grey,
                            focusColor: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 10),
                    CupertinoButton(
                        color: Colors.blueGrey,
                        child: Text('Verify'),
                        onPressed: () {
                          if (_formkey.currentState != null) {
                            if (_formkey.currentState!.validate()) {
                              widget.onVerifyPressed != null
                                  ? widget.onVerifyPressed!(
                                      emailController.text.trim(),
                                      passwordController.text.trim(),
                                    )
                                  : null;

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => SignUp(
                              //         shouldEmailAuthentication:
                              //             widget.shouldEmailAuthentication,
                              //         signUpButtonText: widget.signUpButtonText,
                              //         additionalWidget: widget.additionalWidget,
                              //         onSignUpPressed: widget.onSignUpPressed,
                              //         buttonColor: widget.buttonColor,
                              //         signupAppBarText: widget.signupAppBarText,
                              //         needConfirmPasswordinSignup:
                              //             widget.needConfirmPasswordinSignup,
                              //       ),
                              //     ));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  elevation: 6,
                                  backgroundColor:
                                      Theme.of(context).iconTheme.color,
                                  behavior: SnackBarBehavior.floating,
                                  content: const Text('Check Again'),
                                ),
                              );
                            }
                          }
                        })
                  ]),
            ),
          ),
        ));
  }
}
