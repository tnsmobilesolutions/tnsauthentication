import 'package:authentication/PhoneLogin/PhoneVerificationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef SingleStringParamCallback = Function(String phoneNumber);

class PhoneSignIn extends StatelessWidget {
  PhoneSignIn({Key? key, required this.onPhoneLoginPressed}) : super(key: key);

  final _formkey = GlobalKey<FormState>();
  final SingleStringParamCallback onPhoneLoginPressed;

  final TextEditingController PhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Image(
                  height: 300,
                  width: 600,
                  image: AssetImage('assets/images/login.png'),
                ),
                //Phone Field
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  shadowColor: Colors.black,
                  elevation: 10,
                  color: Colors.amberAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 800,
                      height: 200,
                      child: Column(
                        children: [
                          const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            autofocus: false,
                            controller: PhoneController,
                            keyboardType: TextInputType.phone,
                            onSaved: (value) {
                              value = PhoneController.text;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              contentPadding: EdgeInsets.all(15),
                              hintText: 'Phone Number',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CupertinoButton(
                              color: Colors.blue,
                              child: const Text('Send OTP'),
                              onPressed: () {
                                onPhoneLoginPressed(
                                    PhoneController.text.trim());
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VerificationScreen(
                                          phoneNumber:
                                              PhoneController.text.trim()),
                                    ));
                              }),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // login button
              ],
            )),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('SignIn with Email'),
        ],
      ),
    );
  }
}
