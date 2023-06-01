// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:authentication/EmailLogin/email_verification.dart';
import 'package:authentication/EmailLogin/remeberMe_checkBox.dart';
import 'package:authentication/EmailLogin/sign_up.dart';
import 'package:authentication/PhoneLogin/PhoneVerificationScreen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef DoubleStringParamCallback<T, E> = Function(T first, E second);
typedef ForgetPasswordCallback = Function(String email);
typedef SingleStringParamCallback = Function(String phoneNumber);
typedef RememberMeCallback = Function();
typedef ModelParamCallback = Function(String? email, String? password,
    String? name, String? userId, String? mobile);

class AuthenticationWidget extends StatefulWidget {
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
    this.rememberMe,
    this.loginButonTextColor,
    this.textFieldBorderColor,
    this.textfieldHintColor,
    this.loginPageTextStyle,
    this.phoneHinttext,
    this.phoneHintTextStyle,
    this.emailTextStyle,
    this.passwordTextStyle,
    this.signupAppBarText,
    this.needConfirmPasswordinSignup,
    this.loginButtonTextStyle,
    required this.shouldEmailAuthentication,
    this.onBackPressed,
    this.onVerifyPressed,
    this.emailFieldDecoration,
    this.passwordFieldDecoration,
    this.passwordSuffixIcon,
    this.obscureText,
    this.cursorColor,
    this.forgetPasswordVisibilty,
    this.onForgetPassword,
    this.forgotPasswordTextStyle,
    this.onRememberMePressed,
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
  final ForgetPasswordCallback? onForgetPassword;
  final RememberMeCallback? onRememberMePressed;
  Color? cursorColor;
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
  Widget? title;
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
  TextStyle? emailTextStyle;
  TextStyle? passwordTextStyle;
  TextStyle? loginButtonTextStyle;
  bool? rememberMe;
  double? cardLeftPadding;
  double? cardRightPadding;
  double? cardElevation;
  InputDecoration? emailFieldDecoration, passwordFieldDecoration;
  IconButton? passwordSuffixIcon;
  bool? obscureText;
  bool? forgetPasswordVisibilty = false;
  TextStyle? forgotPasswordTextStyle;
  @override
  State<AuthenticationWidget> createState() => _AuthenticationWidgetState();
}

class _AuthenticationWidgetState extends State<AuthenticationWidget> {
  final emailcontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  bool _isPasswordVisible = true;
  bool _autoValidateEmail = false;
  bool _autoValidatePassword = false;
  bool _isChecked = false;

  // bool _containsAtleast8Characters(String? password) {
  //   return password!.length >= 8;
  // }

  // bool _containsUppercaseLetter(String? password) {
  //   return password!.contains(RegExp(r'[A-Z]'));
  // }

  // bool _containsLowercaseLetter(String? password) {
  //   return password!.contains(RegExp(r'[a-z]'));
  // }

  // bool _containsNumericValue(String? password) {
  //   return password!.contains(RegExp(r'[0-9]'));
  // }

  // bool _containsSymbol(String? password) {
  //   return password!.contains(RegExp(r'[!@#$%^&*~]'));
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.scaffoldbackGroundColor ?? Colors.white,
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
                  widget.isImageVisible == true
                      ? SizedBox(
                          height: widget.imageHeight ?? 250,
                          width: widget.imageWidth ?? 600,
                          child: Image(
                            // height: imageHeight ?? 150,
                            // width: imageWidth ?? 600,
                            image: widget.image ??
                                AssetImage('assets/images/login.png'),
                          ),
                        )
                      : SizedBox(
                          height: widget.imageHeight ?? 200,
                          width: widget.imageWidth ?? 0,
                        ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    shadowColor: widget.buttonColor ?? widget.cardColor,
                    elevation: widget.cardElevation ?? 10,
                    color: widget.cardColor ?? Colors.amberAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SizedBox(
                        height: widget.cardHeight ?? 300,
                        width: widget.cardWidth ?? 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            widget.title ??
                                Text(
                                  'Login',
                                  style: widget.loginPageTextStyle,
                                ),
                            SizedBox(height: 20),
                            widget.phoneAuthentication == true
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
                                      hintText: widget.phoneHinttext ??
                                          'Phone Number',
                                      hintStyle: widget.phoneHintTextStyle ??
                                          TextStyle(
                                              color:
                                                  widget.textfieldHintColor ??
                                                      Colors.black),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                widget.textFieldBorderColor ??
                                                    Colors.white,
                                            width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                widget.textFieldBorderColor ??
                                                    Colors.white),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  )
                                : Column(
                                    children: [
                                      TextFormField(
                                        autovalidateMode: _autoValidateEmail
                                            ? AutovalidateMode.always
                                            : AutovalidateMode.disabled,
                                        style: widget.emailTextStyle ??
                                            TextStyle(color: Colors.black),
                                        cursorColor:
                                            widget.cursorColor ?? Colors.black,
                                        textInputAction: TextInputAction.next,
                                        validator: (value) {
                                          if (!_autoValidateEmail &&
                                              (value == null ||
                                                  value.isEmpty)) {
                                            return ("Please Enter Your Email");
                                          }

                                          if (!RegExp(
                                                  r'^[\w-.]+(\.[\w-.]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$')
                                              .hasMatch(value.toString())) {
                                            return ("Please Enter a valid email");
                                          }
                                          return null;
                                        },
                                        onChanged: (_) {
                                          setState(() {
                                            _autoValidateEmail = true;
                                          });
                                        },
                                        onSaved: (value) {
                                          emailcontroller.text = value!;
                                        },
                                        controller: emailcontroller,
                                        decoration: widget
                                                .emailFieldDecoration ??
                                            InputDecoration(
                                              labelText: 'Email',
                                              labelStyle:
                                                  TextStyle(color: Colors.blue),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue)),
                                              errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey)),
                                            ),
                                      ),
                                      SizedBox(height: 10),
                                      TextFormField(
                                        autovalidateMode: _autoValidatePassword
                                            ? AutovalidateMode.always
                                            : AutovalidateMode.disabled,
                                        style: widget.passwordTextStyle ??
                                            TextStyle(color: Colors.black),
                                        cursorColor:
                                            widget.cursorColor ?? Colors.black,
                                        autofocus: false,
                                        controller: passwordcontroller,
                                        obscureText: widget.obscureText ??
                                            _isPasswordVisible,
                                        validator: (value) {
                                          RegExp regex = RegExp(r'^.{6,}$');
                                          if (!_autoValidatePassword &&
                                              (value == null ||
                                                  value.isEmpty)) {
                                            return ("Password is required for login");
                                          }
                                          if (value!.length < 6) {
                                            return ("Enter Valid Password(Min. 6 Character)");
                                          }
                                          // if (_password != null &&
                                          //     _password!.isNotEmpty) {
                                          //   if (!_containsUppercaseLetter(
                                          //       _password)) {
                                          //     return 'At least one uppercase letter';
                                          //   }
                                          //   if (!_containsLowercaseLetter(
                                          //       _password)) {
                                          //     return 'At least one lowercase letter';
                                          //   }
                                          //   if (!_containsNumericValue(
                                          //       _password)) {
                                          //     return 'At least one numeric value';
                                          //   }
                                          //   if (!_containsSymbol(_password)) {
                                          //     return 'At least one symbol';
                                          //   }
                                          //   if (!_containsAtleast8Characters(
                                          //       _password)) {
                                          //     return 'At least 8 characters';
                                          //   }
                                          // }
                                          return null;
                                        },
                                        onChanged: (_) {
                                          setState(() {
                                            _autoValidatePassword = true;
                                          });
                                        },
                                        onSaved: (value) {
                                          passwordcontroller.text = value!;
                                        },
                                        onFieldSubmitted: (value) {
                                          widget.onEmailLoginPressed!(
                                              emailcontroller.text,
                                              passwordcontroller.text);
                                        },
                                        textInputAction: TextInputAction.done,
                                        decoration: widget
                                                .passwordFieldDecoration ??
                                            InputDecoration(
                                              suffixIcon: widget
                                                      .passwordSuffixIcon ??
                                                  IconButton(
                                                    icon: _isPasswordVisible
                                                        ? Icon(Icons
                                                            .visibility_off)
                                                        : Icon(
                                                            Icons.visibility),
                                                    onPressed: () {
                                                      setState(() {
                                                        _isPasswordVisible =
                                                            !_isPasswordVisible;
                                                      });
                                                    },
                                                  ),
                                              labelText: 'Password',
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue)),
                                              errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey)),
                                            ),
                                      ),
                                      widget.rememberMe == true
                                          ? CheckboxListTile(
                                              title: Text('Remember Me'),
                                              value: _isChecked,
                                              onChanged: (value) {
                                                setState(() {
                                                  _isChecked = value!;
                                                  _isChecked == true
                                                      ? widget
                                                          .onRememberMePressed
                                                      : null;
                                                });
                                              },
                                            )
                                          : SizedBox()
                                    ],
                                  ),
                            SizedBox(height: 20),
                            widget.forgetPasswordVisibilty == true
                                ? TextButton(
                                    onPressed: () {
                                      widget.onForgetPassword!(
                                          emailcontroller.text);
                                    },
                                    child: Text(
                                      'Forgot Password ?',
                                      style: widget.forgotPasswordTextStyle ??
                                          TextStyle(),
                                    ),
                                  )
                                : SizedBox(),
                            SizedBox(height: 10),
                            CupertinoButton(
                              color: widget.buttonColor ?? Colors.cyanAccent,
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  if (widget.phoneAuthentication == true) {
                                    widget.onPhoneLoginPressed != null
                                        ? widget.onPhoneLoginPressed!(
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
                                    widget.onEmailLoginPressed != null
                                        ? widget.onEmailLoginPressed!(
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
                                widget.loginButtonText ?? 'Login',
                                style: widget.loginButtonTextStyle ??
                                    TextStyle(
                                        color: widget.loginButonTextColor ??
                                            Colors.black),
                              ),
                            ),
                            widget.isBiometricAvailable == true
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
        visible: widget.isSignUpVisible,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Don\'t have an account?'),
            TextButton(
              onPressed: () {
                widget.shouldEmailAuthentication == true
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmailVerification(
                            shouldEmailAuthentication:
                                widget.shouldEmailAuthentication,
                            onVerifyPressed: widget.onVerifyPressed,
                            onBackPressed: widget.onBackPressed,
                            signUpButtonText: widget.signUpButtonText,
                            additionalWidget: widget.additionalWidget,
                            onSignUpPressed: widget.onSignUpPressed,
                            buttonColor: widget.buttonColor,
                            signupAppBarText: widget.signupAppBarText,
                            needConfirmPasswordinSignup:
                                widget.needConfirmPasswordinSignup,
                          ),
                        ))
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(
                            shouldEmailAuthentication:
                                widget.shouldEmailAuthentication,
                            signUpButtonText: widget.signUpButtonText,
                            additionalWidget: widget.additionalWidget,
                            onSignUpPressed: widget.onSignUpPressed,
                            buttonColor: widget.buttonColor,
                            signupAppBarText: widget.signupAppBarText,
                            needConfirmPasswordinSignup:
                                widget.needConfirmPasswordinSignup,
                          ),
                        ));
              },
              child: Text('SignUp',
                  style: TextStyle(
                      color: widget.buttonColor ?? Colors.cyanAccent)),
            ),
          ],
        ),
      ),
    );
  }
}
