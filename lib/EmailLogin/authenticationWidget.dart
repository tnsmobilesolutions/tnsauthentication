// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:authentication/EmailLogin/email_verification.dart';
import 'package:authentication/EmailLogin/remeberMe_checkBox.dart';
import 'package:authentication/EmailLogin/sign_up.dart';
import 'package:authentication/PhoneLogin/PhoneVerificationScreen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef DoubleStringParamCallback<T, E> = Function(T first, E second);
typedef SingleStringParamCallback = Function(String phoneNumber);
typedef ModelParamCallback = Function(String? email, String? password,
    String? name, String? userId, String? mobile);

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
    this.cardElevation,
    this.cardHeight,
    this.cardWidth,
    this.isBiometricAvailable,
    //this.rememberMe,
    this.loginButonTextColor,
    this.textFieldBorderColor,
    this.textfieldHintColor,
    this.loginPageTextStyle,
    this.phoneHinttext,
    this.phoneHintTextStyle,
    this.emailHintTextStyle,
    this.passwordHintTextStyle,
    this.signupAppBarText,
    this.needConfirmPasswordinSignup,
    this.loginButtonTextStyle,
    required this.shouldEmailAuthentication,
    this.onBackPressed,
    this.onVerifyPressed,
  }) : super(key: key);

  //final VoidCallback? onTap;
  bool phoneAuthentication = false;
  String? signUpButtonText;
  String? signupAppBarText;
  final DoubleStringParamCallback? onEmailLoginPressed;
  final SingleStringParamCallback? onPhoneLoginPressed;
  final UserModelParamCallback? onSignUpPressed;
  final EmailVerificationCallBack? onVerifyPressed;
  final EmailBackButtonCallBack? onBackPressed;

  bool isSignUpVisible = false;
  bool shouldEmailAuthentication = false;
  Widget? additionalWidget;
  Color? cardColor;
  Color? buttonColor;
  Color? scaffoldbackGroundColor;
  bool? needConfirmPasswordinSignup;
  // InputDecoration? textformFieldInputDecoration;
  Color? loginButonTextColor;
  Color? textFieldBorderColor;
  Color? textfieldHintColor;
  TextStyle? loginPageTextStyle;
  String? title;
  AssetImage? loginImage;
  ImageProvider<Object>? image;
  double? imageHeight;
  double? imageWidth;
  double? cardHeight;
  double? cardWidth;
  bool? isImageVisible = false;
  bool? isBiometricAvailable = false;
  String? emailFieldhintText;
  String? passwordFieldFieldhintText;
  String? phoneHinttext;
  String? loginButtonText;
  TextStyle? phoneHintTextStyle;
  TextStyle? emailHintTextStyle;
  TextStyle? passwordHintTextStyle;
  TextStyle? loginButtonTextStyle;
  // bool? rememberMe;
  double? cardLeftPadding;
  double? cardRightPadding;
  double? cardElevation;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

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
            child: Form(
              key: _formkey,
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
                            image:
                                image ?? AssetImage('assets/images/login.png'),
                          ),
                        )
                      : SizedBox(
                          height: imageHeight ?? 200,
                          width: imageWidth ?? 0,
                        ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    shadowColor: buttonColor ?? cardColor,
                    elevation: cardElevation ?? 10,
                    color: cardColor ?? Colors.amberAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SizedBox(
                        height: cardHeight ?? 300,
                        width: cardWidth ?? 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              title ?? 'Login',
                              style: loginPageTextStyle,
                              // TextStyle(
                              //     fontSize: 40,
                              //     fontWeight: FontWeight.bold,
                              //     color: titleTextColor ?? Colors.black),
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
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.phone),
                                      contentPadding: EdgeInsets.all(15),
                                      hintText: phoneHinttext ?? 'Phone Number',
                                      hintStyle: phoneHintTextStyle ??
                                          TextStyle(
                                              color: textfieldHintColor ??
                                                  Colors.black),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: textFieldBorderColor ??
                                                Colors.white,
                                            width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: textFieldBorderColor ??
                                                Colors.white),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  )
                                : Column(
                                    children: [
                                      TextFormField(
                                        style: emailHintTextStyle ??
                                            TextStyle(color: Colors.black),
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
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: textFieldBorderColor ??
                                                    Colors.white,
                                                width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.all(15),
                                          hintText:
                                              emailFieldhintText ?? 'Email',
                                          hintStyle: emailHintTextStyle,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: textFieldBorderColor ??
                                                    Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      TextFormField(
                                        style: passwordHintTextStyle ??
                                            TextStyle(color: Colors.black),
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
                                        onFieldSubmitted: (value) {
                                          onEmailLoginPressed!(
                                              emailcontroller.text,
                                              passwordcontroller.text);
                                        },
                                        textInputAction: TextInputAction.done,
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: textFieldBorderColor ??
                                                    Colors.white,
                                                width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.all(15),
                                          hintText:
                                              passwordFieldFieldhintText ??
                                                  'Password',
                                          hintStyle: passwordHintTextStyle,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                width: 3,
                                                color: textFieldBorderColor ??
                                                    Colors.greenAccent),
                                          ),
                                        ),
                                      ),
                                      // rememberMe!
                                      //     ? RememberMeCheckbox()
                                      //     : SizedBox()
                                    ],
                                  ),
                            SizedBox(height: 10),
                            CupertinoButton(
                              color: buttonColor ?? Colors.cyanAccent,
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  if (phoneAuthentication == true) {
                                    onPhoneLoginPressed != null
                                        ? onPhoneLoginPressed!(
                                            phoneController.text.trim())
                                        : null;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              VerificationScreen(
                                                  phoneNumber: phoneController
                                                      .text
                                                      .trim()),
                                        ));
                                  } else {
                                    onEmailLoginPressed != null
                                        ? onEmailLoginPressed!(
                                            emailcontroller.text,
                                            passwordcontroller.text)
                                        : null;
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      elevation: 6,
                                      backgroundColor:
                                          Theme.of(context).iconTheme.color,
                                      behavior: SnackBarBehavior.floating,
                                      content: const Text(
                                          'Check Your Email and Password'),
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                loginButtonText ?? 'Login',
                                style: loginButtonTextStyle ??
                                    TextStyle(
                                        color: loginButonTextColor ??
                                            Colors.black),
                              ),
                            ),
                            isBiometricAvailable == true
                                ? CupertinoButton(
                                    child:
                                        const Icon(Icons.fingerprint, size: 50),
                                    onPressed: () async {
                                      // _getAuthentication();
                                      // if (mounted) {
                                      //   final encryptEmail =
                                      //       await SharedPreference()
                                      //           .getStringValuesSF('email');
                                      //   final encryptPassword =
                                      //       await SharedPreference()
                                      //           .getStringValuesSF('password');
                                      //   final decryptEmail = await EncryptData()
                                      //       .decryptAES(encryptEmail);
                                      //   final decryptpassword =
                                      //       await EncryptData()
                                      //           .decryptAES(encryptPassword);
                                      //   log('$encryptEmail, $decryptEmail, $encryptPassword, $decryptpassword');
                                      //   BlocProvider.of<LoginBloc>(context).add(
                                      //       LoginButtonEvent(
                                      //           email: decryptEmail.toString(),
                                      //           password:
                                      //               decryptpassword.toString()));
                                    })
                                : SizedBox(height: 0, width: 0),
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
                shouldEmailAuthentication == true
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmailVerification(
                            shouldEmailAuthentication:
                                shouldEmailAuthentication,
                            onVerifyPressed: onVerifyPressed,
                            onBackPressed: onBackPressed,
                            signUpButtonText: signUpButtonText,
                            additionalWidget: additionalWidget,
                            onSignUpPressed: onSignUpPressed,
                            buttonColor: buttonColor,
                            signupAppBarText: signupAppBarText,
                            needConfirmPasswordinSignup:
                                needConfirmPasswordinSignup,
                          ),
                        ))
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(
                            shouldEmailAuthentication:
                                shouldEmailAuthentication,
                            signUpButtonText: signUpButtonText,
                            additionalWidget: additionalWidget,
                            onSignUpPressed: onSignUpPressed,
                            buttonColor: buttonColor,
                            signupAppBarText: signupAppBarText,
                            needConfirmPasswordinSignup:
                                needConfirmPasswordinSignup,
                          ),
                        ));
              },
              child: Text(
                  shouldEmailAuthentication == true ? 'Verify' : 'SignUp',
                  style: TextStyle(color: buttonColor ?? Colors.cyanAccent)),
            ),
          ],
        ),
      ),
    );
  }
}
