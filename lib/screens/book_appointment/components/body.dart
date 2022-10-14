// ignore_for_file: must_be_immutable, prefer_if_null_operators, unnecessary_null_comparison, prefer_typing_uninitialized_variables

import 'package:babyv_care/screens/booking_calender.dart';
import 'package:babyv_care/utils/default_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../models/appointmentscreen_controller.dart';
import '../../../utils/constants.dart';
import '../../../utils/dafault_button.dart';
import '../../../utils/default_text_field.dart';
import '../../../utils/size_config.dart';

class Body extends StatefulWidget {
  static String routeName = "/appointmentform";

  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();

  var _genderValue;
  var _relationValue;
  var _doctors;
  var setDefaultMake = false, setDefaultMakeModel = true;

  final nameController = TextEditingController();
  final babynameController = TextEditingController();
  final dobController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();
  final pincodeController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    babynameController.dispose();
    dobController.dispose();
    mobileController.dispose();
    address1Controller.dispose();
    address2Controller.dispose();
    emailController.dispose();
    pincodeController.dispose();
    super.dispose();
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: _dateTime == null ? DateTime.now() : _dateTime,
            firstDate: DateTime(2008),
            lastDate: DateTime(2023))
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  DateTime _dateTime = DateTime(2022, 12, 01);

  final _stream = FirebaseFirestore.instance
      .collection('doctors')
      .orderBy('name')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Container();
          if (setDefaultMake) {
            _doctors = snapshot.data!.docs[0].get('name');
          }
          return Form(
              key: _formKey,
              child: Column(children: [
                SizedBox(height: SizeConfig.screenHeight * 0.015),
                const Text(
                  "Fill Out Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.025),
                DefaultField(
                  controller: nameController,
                  keyboardtype: TextInputType.name,
                  maxlength: 15,
                  validate: (namevalue) =>
                      RegExp('[a-zA-Z]').hasMatch(namevalue)
                          ? null
                          : 'Enter a Valid Name',
                  labeltext: "Parent Name",
                  hinttext: "Enter Your Full Name",
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.025),
                DefaultField(
                  controller: babynameController,
                  keyboardtype: TextInputType.name,
                  maxlength: 15,
                  validate: (namevalue) =>
                      RegExp('[a-zA-Z]').hasMatch(namevalue)
                          ? null
                          : 'Enter a Valid Name',
                  hinttext: "Enter Baby Full Name",
                  labeltext: "Baby Name",
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.025),
                TextField(
                    controller: dobController,
                    enableInteractiveSelection: false,
                    readOnly: true,
                    decoration: InputDecoration(
                        fillColor: kTextColor,
                        labelText: "Baby DOB",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText:
                            "${_dateTime.day}/${_dateTime.month}/${_dateTime.year}",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintStyle: const TextStyle(color: Colors.black),
                        labelStyle: const TextStyle(
                            color: kBlack,
                            fontSize: 24,
                            fontWeight: FontWeight.bold))),
                Center(
                  child: MaterialButton(
                    onPressed: _showDatePicker,
                    color: kbg,
                    child: const Text(
                      "Choose Baby Date of Birth",
                      style: TextStyle(color: kWhite),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.035),
                DefaultField(
                  controller: mobileController,
                  keyboardtype: TextInputType.phone,
                  maxlength: 10,
                  validate: (number) =>
                      RegExp(r'(^[0-9]{10}$)').hasMatch(number)
                          ? null
                          : 'Enter a Valid Number',
                  hinttext: "Enter Mobile Number",
                  prefix: Padding(
                    padding: EdgeInsets.all(getProportionateScreenWidth(4)),
                    child: const Text('+91'),
                  ),
                  labeltext: "Mobile Number",
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.025),
                DefaultField(
                  controller: emailController,
                  keyboardtype: TextInputType.emailAddress,
                  maxlength: 25,
                  validate: (email) =>
                      RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(email)
                          ? null
                          : 'Enter a Valid Email',
                  hinttext: "Enter Email Id",
                  prefix: null,
                  labeltext: "Email Id",
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.025),
                DefaultFormField(
                  items: genders.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                  value: _genderValue,
                  labeltext: "Select Gender",
                  hinttext: "Select gender",
                  prefixicon: const Icon(Icons.man_sharp),
                  onChanged: (value) {
                    setState(() {
                      _genderValue = value!;
                    });
                  },
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                DefaultFormField(
                  items:
                      relations.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                  value: _relationValue,
                  labeltext: "Relationship with child",
                  hinttext: " Select gender",
                  prefixicon: const Icon(Icons.man),
                  onChanged: (value) {
                    setState(() {
                      _relationValue = value;
                      // Default dropdown value won't be displayed anymore
                      setDefaultMake = false;
                      // Set makeModel to true to display first car from list
                      setDefaultMakeModel = true;
                    });
                  },
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.025),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kTextColor2),
                  padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                  child: Column(
                    children: [
                      const Text(
                        "Fill Address",
                        style: TextStyle(
                            fontSize: 20,
                            color: kBlack,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.025),
                      DefaultField(
                        controller: address1Controller,
                        keyboardtype: TextInputType.text,
                        maxlength: 15,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Email Address';
                          }
                          return null;
                        },
                        hinttext: "Enter Flat or House Number",
                        prefix: null,
                        labeltext: "Address Line# 1",
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.025),
                      DefaultField(
                        controller: address2Controller,
                        keyboardtype: TextInputType.text,
                        maxlength: 15,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your Address';
                          }
                          return null;
                        },
                        hinttext: "Enter Street Address",
                        prefix: null,
                        labeltext: "Address Line# 2",
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.025),
                      DefaultField(
                        controller: pincodeController,
                        keyboardtype: TextInputType.number,
                        maxlength: 6,
                        validate: (number) =>
                            RegExp(r'(^[0-9]{6}$)').hasMatch(number)
                                ? null
                                : 'Enter a Valid Number',
                        hinttext: "Enter your Pincode",
                        prefix: null,
                        labeltext: "Email Pincode",
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.025),
                      DefaultFormField(
                        items: snapshot.data!.docs.map((value) {
                          return DropdownMenuItem(
                            value: value.get('name'),
                            child: Text(
                              '${value.get('name')}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          );
                        }).toList(),
                        value: _doctors,
                        hinttext: "Select gender",
                        labeltext: "Select Doctor",
                        prefixicon: const Icon(Icons.medication_outlined),
                        onChanged: (value) {
                          // debugPrint('selected onchange: $value');
                          setState(
                            () {
                              // Selected value will be stored
                              _doctors = value;
                              // Default dropdown value won't be displayed anymore
                              setDefaultMake = false;
                              // Set makeModel to true to display first car from list
                              setDefaultMakeModel = true;
                            },
                          );
                        },
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.012),
                    ],
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.012),
                DefaultButton(
                  text: "Choose Your Slot",
                  press: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        nameController.text;
                        babynameController.text;
                        mobileController.text;
                        address1Controller.text;
                        address2Controller.text;
                        pincodeController.text;
                        emailController.text;
                        _genderValue;
                        _relationValue;
                        _doctors;

                        //clearText();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BookingPage(
                                  nameController.text,
                                  babynameController.text,
                                  mobileController.text,
                                  emailController.text,
                                  _genderValue,
                                  _relationValue,
                                  address1Controller.text,
                                  address2Controller.text,
                                  pincodeController.text,
                                  _doctors,
                                )));
                      });
                    }
                  },
                ),
              ]));
        });
  }
}
