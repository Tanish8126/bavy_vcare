import 'package:babyv_care/utils/default_field.dart';
import 'package:flutter/material.dart';

import '../../utils/dafault_button.dart';
import '../../utils/size_config.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/loginscreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Column(children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text(
                      "Welcome Back\nSign in with your Mobile Number",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40, right: 10, left: 10),
                      child: DefaultField(
                        labeltext: "Mobile Number",
                        hinttext: "Enter your Mobile Number",
                        maxlength: 10,
                        controller: _controller,
                        prefix: Padding(
                          padding: EdgeInsets.all(4),
                          child: Text('+91'),
                        ),
                        validate: (value) {
                          if (value!.isEmpty || value.length < 10) {
                            return 'Please Enter 10 Digit Mobile Number';
                          }
                          return null;
                        },
                        keyboardtype: TextInputType.number,
                      ),
                    ),
                  ],
                )
              ]),
              SizedBox(
                height: 50,
              ),
              DefaultButton(
                  text: "GET OTP",
                  press: () {
                    if (_formKey.currentState!.validate())
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OtpScreen(_controller.text)));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
