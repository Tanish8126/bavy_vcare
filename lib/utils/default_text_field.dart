// ignore_for_file: prefer_typing_uninitialized_variables, unnecessary_const

import 'package:flutter/material.dart';

import 'constants.dart';

class DefaultField extends StatelessWidget {
  const DefaultField(
      {Key? key,
      this.controller,
      this.labeltext,
      this.hinttext,
      this.validate,
      this.maxlength,
      this.prefix,
      this.prefixicon,
      this.keyboardtype})
      : super(key: key);

  final controller;
  final String? labeltext;
  final String? hinttext;
  final keyboardtype;
  final validate;
  final maxlength;
  final prefix;
  final prefixicon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardtype,
      style: const TextStyle(color: kMainColor),
      controller: controller,
      maxLength: maxlength,
      validator: validate,
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: kbg)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          fillColor: kTextColor,
          labelText: labeltext,
          prefix: prefix,
          prefixIcon: prefixicon,
          hintText: hinttext,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: const TextStyle(color: kPrimaryLightColor),
          labelStyle: const TextStyle(
              color: kMainColor, fontSize: 24, fontWeight: FontWeight.bold)),
    );
  }
}
