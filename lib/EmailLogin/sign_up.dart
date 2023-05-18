// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

typedef UserModelParamCallback = Function(String? email, String? password,
    String? name, String? userId, String? mobile);

class SignUp extends StatefulWidget {
  SignUp({
    Key? key,
    this.onSignUpPressed,
    this.signUpButtonText,
    this.additionalWidget,
    this.buttonColor,
    this.needConfirmPasswordinSignup,
    this.signupAppBarText,
    required this.shouldEmailAuthentication,
  }) : super(key: key);
  final UserModelParamCallback? onSignUpPressed;
  bool shouldEmailAuthentication;
  Widget? additionalWidget;
  String? signUpButtonText;
  Color? buttonColor;
  String? signupAppBarText;
  bool? needConfirmPasswordinSignup;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool ispasswordVisible = false;

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final mobileController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.signupAppBarText ?? 'Signup'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.shouldEmailAuthentication == false
                    ? TextFormField(
                        controller: nameController,
                        onSaved: (newValue) => nameController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter name';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: 'Name',
                            hintStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            fillColor: Colors.grey,
                            focusColor: Colors.grey),
                      )
                    : SizedBox(),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  onSaved: (newValue) => emailController,
                  validator: (value) {
                    // Returns true if email address is in use.

                    if (value == null || value.isEmpty) {
                      return ("Please enter Your Email");
                    }
                    // reg expression for email validation
                    else if (!(RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z]+\.[a-zA-Z]+"))
                        .hasMatch(value)) {
                      return ("Please enter a valid email");
                    }
                    //else if () {}
                    return null;
                  },
                  decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: 'Enter Your Email',
                      hintStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      fillColor: Colors.grey,
                      focusColor: Colors.grey),
                ),
                SizedBox(height: 10),
                widget.shouldEmailAuthentication == false
                    ? TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: mobileController,
                        onSaved: (newValue) => mobileController,
                        validator: (value) {
                          RegExp regex = RegExp(r'^.{10}$');
                          if (value!.isEmpty) {
                            return ("Please enter Phone Number");
                          }
                          if (!regex.hasMatch(value) && value.length != 10) {
                            return ("Enter 10 Digit Mobile Number");
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            icon: Icon(Icons.phone),
                            hintText: 'Enter Your Mobile Number',
                            hintStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            fillColor: Colors.grey,
                            focusColor: Colors.grey),
                      )
                    : SizedBox(),
                SizedBox(height: 10),
                widget.shouldEmailAuthentication == false
                    ? TextFormField(
                        obscureText: ispasswordVisible,
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
                                ispasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.blue,
                              ),
                              onPressed: () {
                                setState(() {
                                  ispasswordVisible = !ispasswordVisible;
                                });
                              },
                            ),
                            icon: Icon(Icons.password),
                            hintText: 'Enter Password',
                            hintStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            fillColor: Colors.grey,
                            focusColor: Colors.grey),
                      )
                    : SizedBox(),
                SizedBox(height: 10),
                if (widget.needConfirmPasswordinSignup == true &&
                    widget.shouldEmailAuthentication == false)
                  TextFormField(
                    controller: confirmPasswordController,
                    onSaved: (newValue) => confirmPasswordController,
                    validator: (value) {
                      if (confirmPasswordController.text.trim() !=
                          passwordController.text.trim()) {
                        return "Password don't match";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            ispasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            setState(() {
                              ispasswordVisible = !ispasswordVisible;
                            });
                          },
                        ),
                        icon: Icon(Icons.password),
                        hintText: 'confirm Password',
                        hintStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        fillColor: Colors.grey,
                        focusColor: Colors.grey),
                  ),
                widget.additionalWidget ?? const SizedBox(height: 0),
                SizedBox(
                  height: 20,
                ),
                widget.shouldEmailAuthentication == false
                    ? CupertinoButton(
                        color: widget.buttonColor ?? Colors.blueGrey,
                        child: Text(widget.signUpButtonText ?? 'SignUp'),
                        onPressed: () {
                          if (_formkey.currentState != null) {
                            if (_formkey.currentState!.validate()) {
                              widget.onSignUpPressed != null
                                  ? widget.onSignUpPressed!(
                                      emailController.text.trim(),
                                      passwordController.text.trim(),
                                      nameController.text.trim(),
                                      const Uuid().v1(),
                                      mobileController.text.trim(),
                                    )
                                  : null;
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
                    : CupertinoButton(
                        color: widget.buttonColor ?? Colors.blueGrey,
                        child: Text(widget.signUpButtonText ?? 'Verify'),
                        onPressed: () {
                          if (_formkey.currentState != null) {
                            if (_formkey.currentState!.validate()) {
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
              ],
            ),
          ),
        ),
      )),
    );
  }
}
