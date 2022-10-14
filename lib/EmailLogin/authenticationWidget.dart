// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:authentication/EmailLogin/sign_up.dart';
import 'package:authentication/PhoneLogin/PhoneVerificationScreen.dart';
import 'package:authentication/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef DoubleStringParamCallback<T, E> = Function(T first, E second);
typedef SingleStringParamCallback = Function(String phoneNumber);
typedef ModelParamCallback = Function(userModel user);

class AuthenticationWidget extends StatelessWidget {
  AuthenticationWidget({
    Key? key,
    this.buttonColor,
    this.additionalWidget,
    this.image,
    this.onEmailLoginPressed,
    required this.isSignUpVisible,
    this.emailFieldhintText,
    this.passwordFieldFieldhintText,
    this.loginButtonText,
    this.title,
    required this.phoneAuthentication,
    this.onPhoneLoginPressed,
    this.onSignUpPressed,
    this.signUpButtonText,
    this.cardColor,
    this.scaffoldbackGroundColor,
    this.isImageVisible,
    this.loginImage,
    this.cardLeftPadding,
    this.cardRightPadding,
    this.imageHeight,
    this.imageWidth,
  }) : super(key: key);

  //final VoidCallback? onTap;
  bool phoneAuthentication = false;
  String? signUpButtonText;
  final DoubleStringParamCallback? onEmailLoginPressed;
  final SingleStringParamCallback? onPhoneLoginPressed;
  final UserModelParamCallback? onSignUpPressed;
  bool isSignUpVisible = false;
  Widget? additionalWidget;
  Color? cardColor;
  Color? buttonColor;
  Color? scaffoldbackGroundColor;
  String? title;
  AssetImage? loginImage;
  ImageProvider<Object>? image;
  double? imageHeight;
  double? imageWidth;
  bool? isImageVisible = false;
  String? emailFieldhintText;
  String? passwordFieldFieldhintText;
  String? loginButtonText;
  double? cardLeftPadding;
  double? cardRightPadding;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldbackGroundColor ?? Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            // decoration: BoxDecoration(
            //     border: Border.all(color: Colors.grey),
            //     borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isImageVisible == true
                    ? SizedBox(
                        height: imageHeight ?? 250,
                        width: imageWidth ?? 600,
                        child: Image(
                          // height: imageHeight ?? 150,
                          // width: imageWidth ?? 600,
                          image: image ?? AssetImage('assets/images/login.png'),
                        ),
                      )
                    : SizedBox(
                        height: 200,
                        width: 0,
                      ),
                SizedBox(
                  height: imageHeight ?? 300,
                  width: imageWidth ?? 600,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    shadowColor: Colors.black,
                    elevation: 10,
                    color: cardColor ?? Colors.amberAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            title ?? 'Login',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          phoneAuthentication == true
                              ? TextFormField(
                                  autofocus: false,
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  onSaved: (value) {
                                    value = phoneController.text;
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.phone),
                                    contentPadding: EdgeInsets.all(15),
                                    hintText: 'Phone Number',
                                  ),
                                )
                              : Column(
                                  children: [
                                    TextFormField(
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return ("Please Enter Your Email");
                                        }

                                        if (!RegExp(
                                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                            .hasMatch(value)) {
                                          return ("Please Enter a valid email");
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        emailcontroller.text = value!;
                                      },
                                      controller: emailcontroller,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(15),
                                        hintText: emailFieldhintText ?? 'Email',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    TextFormField(
                                      autofocus: false,
                                      controller: passwordcontroller,
                                      obscureText: true,
                                      validator: (value) {
                                        RegExp regex = RegExp(r'^.{6,}$');
                                        if (value!.isEmpty) {
                                          return ("Password is required for login");
                                        }
                                        if (!regex.hasMatch(value)) {
                                          return ("Enter Valid Password(Min. 6 Character)");
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        passwordcontroller.text = value!;
                                      },
                                      textInputAction: TextInputAction.done,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.all(15),
                                        hintText: passwordFieldFieldhintText ??
                                            'Password',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          SizedBox(height: 10),
                          CupertinoButton(
                            color: buttonColor ?? Colors.cyanAccent,
                            onPressed: () {
                              if (phoneAuthentication == true) {
                                onPhoneLoginPressed!(
                                    phoneController.text.trim());
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VerificationScreen(
                                          phoneNumber:
                                              phoneController.text.trim()),
                                    ));
                              } else {
                                onEmailLoginPressed!(emailcontroller.text,
                                    passwordcontroller.text);
                              }
                            },
                            child: Text(loginButtonText ?? 'Login'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: isSignUpVisible,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Don\'t have an account?'),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUp(
                        signUpButtonText: signUpButtonText,
                        additionalWidget: additionalWidget,
                        onSignUpPressed: onSignUpPressed,
                        buttonColor: buttonColor,
                      ),
                    ));
              },
              child: Text(
                'SignUp',
              ),
            )
          ],
        ),
      ),
    );
  }
}
