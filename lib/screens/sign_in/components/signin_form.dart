import 'package:babyv_care/screens/otp/otp_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/custom_suffix_icon.dart';
import '../../../utils/dafault_button.dart';
import '../../../utils/size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? mobile;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          buildMobileFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
              text: "GET OTP",
              press: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OtpScreen(_controller.text)));
                // Navigator.pushNamed(context, OtpScreen.routeName);
              })
        ]));
  }

  TextFormField buildMobileFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      maxLength: 10,
      decoration: InputDecoration(
        labelText: "Mobile Number",
        hintText: "Enter your Mobile Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          svgIcon: "assets/icons/Call.svg",
        ),
      ),
    );
  }
}
