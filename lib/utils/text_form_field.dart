import 'package:flutter/material.dart';

import 'constants.dart';
import 'size_config.dart';

class DefaultField extends StatelessWidget {
  const DefaultField(
      {Key? key,
      this.controller,
      this.labeltext,
      this.hinttext,
      this.validate,
      this.maxlength,
      this.keyboardtype})
      : super(key: key);

  final controller;
  final String? labeltext;
  final String? hinttext;
  final keyboardtype;
  final validate;
  final maxlength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardtype,
      style: TextStyle(color: kPrimaryLightColor),
      controller: controller,
      maxLength: maxlength,
      validator: validate,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kbg)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          fillColor: kTextColor,
          labelText: labeltext,
          hintText: hinttext,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: TextStyle(color: kPrimaryLightColor),
          labelStyle: TextStyle(
              color: kMainColor, fontSize: 24, fontWeight: FontWeight.bold)),
    );
  }
}
