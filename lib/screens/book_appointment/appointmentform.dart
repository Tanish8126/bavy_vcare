// ignore_for_file: must_be_immutable, prefer_if_null_operators, unnecessary_null_comparison

import 'package:babyv_care/screens/booking_calender.dart';
import 'package:babyv_care/utils/default_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../controllers/appointment_controller.dart';
import '../../utils/constants.dart';
import '../../utils/dafault_button.dart';
import '../../utils/default_text_field.dart';
import '../../utils/size_config.dart';

class AppointmentForm extends StatefulWidget {
  static String routeName = "/appointmentform";
  String babyage;
  String selectedvaccine;
  AppointmentForm(this.babyage, this.selectedvaccine, {Key? key})
      : super(key: key);

  @override
  State<AppointmentForm> createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  final _formKey = GlobalKey<FormState>();

  String genderValue = genders.first;
  String relationValue = relations.first;

  var doctors;
  var setDefaultMake = true, setDefaultMakeModel = true;

  final nameController = TextEditingController();
  final babynameController = TextEditingController();
  final dobController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    babynameController.dispose();
    dobController.dispose();
    mobileController.dispose();
    addressController.dispose();
    emailController.dispose();
    super.dispose();
  }

  clearText() {
    nameController.clear();
    babynameController.clear();
    dobController.clear();
    mobileController.clear();
    emailController.clear();
    addressController.clear();
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

  // final String dateFormat = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    // debugPrint('doctor: $doctors');
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('doctors')
            .orderBy('name')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Container();
          if (setDefaultMake) {
            doctors = snapshot.data!.docs[0].get('name');
            //debugPrint('setDefault make: $doctors');
          }
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Appointment Form"),
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [kbg, Color(0xff82c3df)],
                          begin: FractionalOffset(0, 0),
                          end: FractionalOffset(1.0, 0),
                          tileMode: TileMode.clamp)),
                ),
              ),
              body: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                        padding:
                            EdgeInsets.all(getProportionateScreenWidth(12)),
                        child: Column(children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kTextColor2),
                            child: Column(
                              children: [
                                SizedBox(
                                    height: SizeConfig.screenHeight * 0.015),
                                const Text("Selected Age",
                                    style: TextStyle(
                                        color: kBlack,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(widget.babyage,
                                    style: const TextStyle(
                                        color: kBlack,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal)),
                                SizedBox(
                                    height: SizeConfig.screenHeight * 0.010),
                                const Text("Selected Vaccine",
                                    style: TextStyle(
                                        color: kBlack,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(widget.selectedvaccine,
                                    style: const TextStyle(
                                        color: kBlack,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal)),
                                SizedBox(
                                    height: SizeConfig.screenHeight * 0.015),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(height: SizeConfig.screenHeight * 0.015),
                              const Text(
                                "Fill Out Details",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: SizeConfig.screenHeight * 0.025),
                              DefaultField(
                                controller: nameController,
                                keyboardtype: TextInputType.name,
                                maxlength: 15,
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Your Full Name';
                                  }
                                  return null;
                                },
                                labeltext: "Parent Name",
                                hinttext: "Enter Your Full Name",
                              ),
                              SizedBox(height: SizeConfig.screenHeight * 0.025),
                              DefaultField(
                                controller: babynameController,
                                keyboardtype: TextInputType.name,
                                maxlength: 15,
                                validate: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Baby Name';
                                  }
                                  return null;
                                },
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
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      hintStyle:
                                          const TextStyle(color: Colors.black),
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
                                validate: (value) {
                                  if (value!.isEmpty || value.length < 10) {
                                    return 'Please Enter 10 Digit Mobile Number';
                                  }
                                  return null;
                                },
                                hinttext: "Enter Mobile Number",
                                prefix: Padding(
                                  padding: EdgeInsets.all(
                                      getProportionateScreenWidth(4)),
                                  child: const Text('+91'),
                                ),
                                labeltext: "Mobile Number",
                              ),
                              SizedBox(height: SizeConfig.screenHeight * 0.025),
                              DefaultField(
                                controller: emailController,
                                keyboardtype: TextInputType.emailAddress,
                                maxlength: null,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Enter Email Address';
                                  }
                                  return null;
                                },
                                hinttext: "Enter Email Id",
                                prefix: null,
                                labeltext: "Email Id",
                              ),
                              SizedBox(height: SizeConfig.screenHeight * 0.025),
                              TextFormField(
                                keyboardType: TextInputType.streetAddress,
                                style:
                                    const TextStyle(color: kPrimaryLightColor),
                                controller: addressController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Your Address';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    fillColor: kTextColor,
                                    labelText: "Address",
                                    hintText: "Enter Your Address",
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    hintStyle: const TextStyle(
                                        color: kPrimaryLightColor),
                                    labelStyle: const TextStyle(
                                        color: kBlack,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(height: SizeConfig.screenHeight * 0.025),
                              DefaultFormField(
                                items: genders.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                value: genderValue,
                                labeltext: "Select Gender",
                                hinttext: "Select gender",
                                prefixicon: const Icon(Icons.man_sharp),
                                onChanged: (value) {
                                  setState(() {
                                    genderValue = value!;
                                  });
                                },
                              ),
                              SizedBox(height: SizeConfig.screenHeight * 0.03),
                              DefaultFormField(
                                items: relations.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                value: relationValue,
                                labeltext: "Relationship with child",
                                hinttext: " Select gender",
                                prefixicon: const Icon(Icons.man),
                                onChanged: (value) {
                                  setState(() {
                                    relationValue = value!;
                                  });
                                },
                              ),
                              SizedBox(height: SizeConfig.screenHeight * 0.025),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: kTextColor2),
                                padding: EdgeInsets.all(
                                    getProportionateScreenWidth(15)),
                                child: Column(
                                  children: [
                                    const Text(
                                      "Make Appointment",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: kBlack,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.screenHeight * 0.025),
                                    DefaultFormField(
                                      items: snapshot.data!.docs.map((value) {
                                        return DropdownMenuItem(
                                          value: value.get('name'),
                                          child: Text('${value.get('name')}'),
                                        );
                                      }).toList(),
                                      value: doctors,
                                      hinttext: "Select gender",
                                      labeltext: "Select Doctor",
                                      prefixicon:
                                          const Icon(Icons.medication_outlined),
                                      onChanged: (value) {
                                        debugPrint('selected onchange: $value');
                                        setState(
                                          () {
                                            // Selected value will be stored
                                            doctors = value;
                                            // Default dropdown value won't be displayed anymore
                                            setDefaultMake = false;
                                            // Set makeModel to true to display first car from list
                                            setDefaultMakeModel = true;
                                          },
                                        );
                                      },
                                    ),
                                    SizedBox(
                                        height:
                                            SizeConfig.screenHeight * 0.012),
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
                                      addressController.text;
                                      genderValue;
                                      relationValue;
                                      doctors;
                                      emailController.text;

                                      //clearText();
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => BookingPage(
                                                  nameController.text,
                                                  mobileController.text,
                                                  addressController.text,
                                                  genderValue,
                                                  babynameController.text,
                                                  doctors,
                                                  relationValue,
                                                  emailController.text)));
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ])),
                  )),
            ),
          );
        });
  }
}
