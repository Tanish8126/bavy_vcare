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
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [kbg, Color(0xff82c3df)],
                      begin: FractionalOffset(0, 0),
                      end: FractionalOffset(1.0, 0),
                      tileMode: TileMode.clamp)),
            ),
          ),
          body: Column(children: [
            Material(
              borderRadius: const BorderRadius.only(
                  bottomRight: const Radius.circular(100)),
              color: const Color.fromARGB(255, 134, 190, 239),
              elevation: 10,
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
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
                        prefix: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Text(
                            '+91',
                            style: TextStyle(color: kMainColor),
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
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
