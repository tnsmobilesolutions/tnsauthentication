import 'package:authentication/EmailLogin/email_verification.dart';
import 'package:authentication/EmailLogin/sign_up.dart';
import 'package:authentication/PhoneLogin/phone_verification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef DoubleStringParamCallback<T, E> = Function(T first, E second);
typedef ForgetPasswordCallback = Function(String email);
typedef SingleStringParamCallback = Function(String phoneNumber);
typedef RememberMeCallback = Function();
typedef ModelParamCallback = Function(String? email, String? password,
    String? name, String? userId, String? mobile);

// ignore: must_be_immutable
class AuthenticationWidget extends StatefulWidget {
  AuthenticationWidget(
      {Key? key,
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
      this.rememberMeBackgroundColor,
      this.rememberMeIconColor,
      this.rememberMeWidget,
      this.rememberMeIcon,
      this.textForSignup,
      this.signupOnpressedonLoginButton})
      : super(key: key);

  Widget? additionalWidget;
  final VoidCallback? signupOnpressedonLoginButton;
  Color? buttonColor;
  Color? cardColor;
  double? cardElevation;
  double? cardHeight;
  double? cardLeftPadding;
  double? cardRightPadding;
  double? cardWidth;
  Color? cursorColor;
  String? emailFieldhintText;
  String? textForSignup;
  TextStyle? emailTextStyle;
  bool? forgetPasswordVisibilty = false;
  TextStyle? forgotPasswordTextStyle;
  ImageProvider<Object>? image;
  double? imageHeight;
  double? imageWidth;
  bool? isBiometricAvailable = false;
  bool? isImageVisible = false;
  bool isSignUpVisible = false;
  // InputDecoration? textformFieldInputDecoration;
  Color? loginButonTextColor;
  String? loginButtonText;
  TextStyle? loginButtonTextStyle;
  AssetImage? loginImage;
  TextStyle? loginPageTextStyle;
  bool? needConfirmPasswordinSignup;
  bool? obscureText;
  final FunctionCallBack? onBackPressed;
  final DoubleStringParamCallback? onEmailLoginPressed;
  final ForgetPasswordCallback? onForgetPassword;
  final SingleStringParamCallback? onPhoneLoginPressed;
  final RememberMeCallback? onRememberMePressed;
  final UserModelParamCallback? onSignUpPressed;
  final EmailVerificationCallBack? onVerifyPressed;
  InputDecoration? emailFieldDecoration, passwordFieldDecoration;
  String? passwordFieldFieldhintText;
  IconButton? passwordSuffixIcon;
  TextStyle? passwordTextStyle;
  //final VoidCallback? onTap;
  bool phoneAuthentication = false;
  TextStyle? phoneHintTextStyle;
  String? phoneHinttext;
  bool? rememberMe;
  Color? scaffoldbackGroundColor;
  bool shouldEmailAuthentication = false;
  String? signUpButtonText;
  String? signupAppBarText;
  Color? textFieldBorderColor;
  Color? textfieldHintColor;
  Widget? title;
  Color? rememberMeIconColor;
  Color? rememberMeBackgroundColor;
  Widget? rememberMeIcon;
  Widget? rememberMeWidget;

  @override
  State<AuthenticationWidget> createState() => _AuthenticationWidgetState();
}

class _AuthenticationWidgetState extends State<AuthenticationWidget> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool _autoValidateEmail = false;
  bool _autoValidatePassword = false;
  final _formkey = GlobalKey<FormState>();
  bool _isChecked = false;
  bool _isPasswordVisible = true;
  // bool _isSwitched = false;

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
          child: SizedBox(
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
                                const AssetImage('assets/images/login.png'),
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
                            const SizedBox(height: 20),
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
                                      prefixIcon: const Icon(Icons.phone),
                                      contentPadding: const EdgeInsets.all(15),
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
                                            const TextStyle(
                                                color: Colors.black),
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
                                            const InputDecoration(
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
                                      const SizedBox(height: 10),
                                      TextFormField(
                                        autovalidateMode: _autoValidatePassword
                                            ? AutovalidateMode.always
                                            : AutovalidateMode.disabled,
                                        style: widget.passwordTextStyle ??
                                            const TextStyle(
                                                color: Colors.black),
                                        cursorColor:
                                            widget.cursorColor ?? Colors.black,
                                        autofocus: false,
                                        controller: passwordcontroller,
                                        obscureText: widget.obscureText ??
                                            _isPasswordVisible,
                                        validator: (value) {
                                          // RegExp regex = RegExp(r'^.{6,}$');
                                          if (!_autoValidatePassword &&
                                              (value == null ||
                                                  value.isEmpty)) {
                                            return ("Password is required for login");
                                          }
                                          if (value!.length < 6) {
                                            return ("Enter Valid Password(Min. 6 Character)");
                                          }
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
                                                        ? const Icon(Icons
                                                            .visibility_off)
                                                        : const Icon(
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
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey)),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.blue)),
                                              errorBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey)),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey)),
                                            ),
                                      ),
                                      widget.rememberMe == true
                                          ? Column(
                                              children: [
                                                const SizedBox(height: 20),
                                                Row(
                                                  children: [
                                                    widget.rememberMeWidget ??
                                                        IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              _isChecked =
                                                                  !_isChecked;
                                                              widget
                                                                  .onRememberMePressed;
                                                            });
                                                          },
                                                          icon: Icon(
                                                            Icons.done,
                                                            size: 18,
                                                            color: _isChecked
                                                                ? widget
                                                                    .rememberMeIconColor
                                                                : Colors.grey,
                                                          ),
                                                        ),
                                                    const SizedBox(width: 5),
                                                    const Text('Remember me'),
                                                  ],
                                                ),
                                              ],
                                            )
                                          : const SizedBox()
                                    ],
                                  ),
                            const SizedBox(height: 20),
                            widget.forgetPasswordVisibilty == true
                                ? TextButton(
                                    onPressed: () {
                                      widget.onForgetPassword!(
                                          emailcontroller.text);
                                    },
                                    child: Text(
                                      'Forgot Password ?',
                                      style: widget.forgotPasswordTextStyle ??
                                          const TextStyle(),
                                    ),
                                  )
                                : const SizedBox(),
                            const SizedBox(height: 10),
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
                                : const SizedBox(height: 0, width: 0),
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
            Text(widget.textForSignup ?? 'Don\'t have an account?'),
            TextButton(
              onPressed: widget.signupOnpressedonLoginButton,

              // onPressed: () {
              //   widget.shouldEmailAuthentication == true
              //       ? Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => EmailVerification(
              //               shouldEmailAuthentication:
              //                   widget.shouldEmailAuthentication,
              //               onVerifyPressed: widget.onVerifyPressed,
              //               onBackPressed: widget.onBackPressed,
              //               signUpButtonText: widget.signUpButtonText,
              //               additionalWidget: widget.additionalWidget,
              //               onSignUpPressed: widget.onSignUpPressed,
              //               buttonColor: widget.buttonColor,
              //               signupAppBarText: widget.signupAppBarText,
              //               needConfirmPasswordinSignup:
              //                   widget.needConfirmPasswordinSignup,
              //             ),
              //           ))
              //       : Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => SignUp(
              //               shouldEmailAuthentication:
              //               widget.shouldEmailAuthentication,
              //               signUpButtonText: widget.signUpButtonText,
              //               additionalWidget: widget.additionalWidget,
              //               onSignUpPressed: widget.onSignUpPressed,
              //               buttonColor: widget.buttonColor,
              //               signupAppBarText: widget.signupAppBarText,
              //               needConfirmPasswordinSignup:
              //                   widget.needConfirmPasswordinSignup,
              //             ),
              //           ));
              // },
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
