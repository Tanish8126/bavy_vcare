import 'package:babyv_care/utils/constants.dart';
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
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: kMainColor2,
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
              Container(
                margin: EdgeInsets.only(top: 40, right: 10, left: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Mobile Number",
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                    hintText: "Enter your Mobile Number",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    prefix: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text('+91'),
                    ),
                  ),
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  controller: _controller,
                  validator: (value) {
                    if (value == 10) {
                      return 'Please Enter Your Mobile Number';
                    }
                    return null;
                  },
                ),
              )
            ]),
            SizedBox(
              height: 50,
            ),
            DefaultButton(
                text: "GET OTP",
                press: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OtpScreen(_controller.text)));
                }),
          ],
        ),
      ),
    );
  }
}
