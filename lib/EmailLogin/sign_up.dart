import 'package:authentication/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef UserModelParamCallback = Function(userModel user);

class SignUp extends StatelessWidget {
  SignUp({
    Key? key,
    this.onSignUpPressed,
    this.signUpButtonText,
    this.additionalWidget,
    this.buttonColor,
  }) : super(key: key);
  final UserModelParamCallback? onSignUpPressed;
  Widget? additionalWidget;
  String? signUpButtonText;
  Color? buttonColor;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('signUp'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                onSaved: (newValue) => nameController,
                decoration: const InputDecoration(
                    hintText: 'Name',
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    fillColor: Colors.grey,
                    focusColor: Colors.grey),
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                onSaved: (newValue) => emailController,
                decoration: const InputDecoration(
                    hintText: 'Enter Your Email',
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    fillColor: Colors.grey,
                    focusColor: Colors.grey),
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: mobileController,
                onSaved: (newValue) => mobileController,
                decoration: const InputDecoration(
                    hintText: 'Enter Your Mobile Number',
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    fillColor: Colors.grey,
                    focusColor: Colors.grey),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                onSaved: (newValue) => passwordController,
                decoration: const InputDecoration(
                    hintText: 'Enter Password',
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    fillColor: Colors.grey,
                    focusColor: Colors.grey),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: confirmPasswordController,
                onSaved: (newValue) => confirmPasswordController,
                decoration: const InputDecoration(
                    hintText: 'confirm Password',
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    fillColor: Colors.grey,
                    focusColor: Colors.grey),
              ),
              additionalWidget ?? const SizedBox(height: 0),
              SizedBox(
                height: 20,
              ),
              CupertinoButton(
                  color: buttonColor ?? Colors.blueGrey,
                  child: Text(signUpButtonText ?? 'SignUp'),
                  onPressed: () {
                    final user = userModel(
                      name: nameController.text.trim(),
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                      phoneNumber: mobileController.text.trim(),
                    );
                    onSignUpPressed!(user);
                  })
            ],
          ),
        ),
      )),
    );
  }
}
