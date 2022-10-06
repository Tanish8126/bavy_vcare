// ignore_for_file: prefer_typing_uninitialized_variables, unnecessary_const

import 'package:flutter/material.dart';

import 'constants.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField(
      {Key? key,
      this.icon,
      this.value,
      this.labeltext,
      this.hinttext,
      this.validate,
      this.items,
      this.prefix,
      this.prefixicon,
      this.onChanged})
      : super(key: key);

  final value;
  final String? labeltext;
  final String? hinttext;
  final items;
  final validate;
  final onChanged;
  final prefix;
  final prefixicon;
  final icon;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        items: items,
        onChanged: onChanged,
        alignment: AlignmentDirectional.center,
        value: value,
        isExpanded: true,
        icon: icon,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder:
              const OutlineInputBorder(borderSide: BorderSide(color: kbg)),
          prefixIcon: prefixicon,
          labelStyle: const TextStyle(
              color: kMainColor, fontSize: 24, fontWeight: FontWeight.bold),
          label: Text(labeltext!),
        ),
        elevation: 0,
        hint: Text(hinttext!),
        iconEnabledColor: Colors.black,
        style: const TextStyle(color: Colors.black),
        validator: validate);
  }
}
