// ignore_for_file: library_private_types_in_public_api

import 'package:babyv_care/utils/default_text_field.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/dafault_button.dart';
import '../../utils/size_config.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/loginscreen";

  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
            backgroundColor: kbg,
          ),
          body: Column(children: [
            Material(
              borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(100)),
              color: kbg,
              elevation: 10,
              child: SizedBox(
                height: getProportionateScreenHeight(300),
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Welcome Back\nSign in with your Mobile Number",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      DefaultField(
                        labeltext: "Mobile Number",
                        hinttext: "Enter your Mobile Number",
                        maxlength: 10,
                        controller: _controller,
                        prefix: Padding(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(4)),
                          child: const Text(
                            '+91',
                            style: TextStyle(color: kBlack),
                          ),
                        ),
                        validate: (value) {
                          if (value!.isEmpty || value.length < 10) {
                            return 'Please Enter 10 Digit Mobile Number';
                          }
                          return null;
                        },
                        keyboardtype: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.035),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10)),
              child: DefaultButton(
                  text: "GET OTP",
                  press: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OtpScreen(_controller.text)));
                    }
                  }),
            )
          ]),
        ));
  }
}
