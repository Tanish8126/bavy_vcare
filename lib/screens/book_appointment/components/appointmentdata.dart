import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../../../utils/constants.dart';
import '../../../utils/dafault_button2.dart';
import '../../booking_calender.dart';

class AppForm extends StatefulWidget {
  AppForm({Key? key}) : super(key: key);

  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  final _formKey = GlobalKey<FormState>();

  var name = "";
  var babyname = "";
  var dob = "";
  var mobile = "";
  var address = "";
  var gender = "";
  var relation = "";
  var doctor = "";

  final nameController = TextEditingController();
  final babynameController = TextEditingController();
  final dobController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final genderController = TextEditingController();
  final relationController = TextEditingController();
  final doctorController = TextEditingController();

  List<dynamic> genders = [];
  List<dynamic> doctors = [];
  List<dynamic> relations = [];

  String? genderId;
  String? relationId;
  String? doctorId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.genders.add({"id": 1, "name": "Male"});
    this.genders.add({"id": 2, "name": "Female"});
    this.relations.add({"id": 1, "name": "Father"});
    this.relations.add({"id": 2, "name": "Mother"});
    this.relations.add({"id": 3, "name": "Gaurdian"});
    this
        .doctors
        .add({"id": 1, "name": "Dr. Rahul(170/1-5th Main Bangalore-560064)"});
    this
        .doctors
        .add({"id": 2, "name": "Dr. Batra(170/1-5th Main Bangalore-560064)"});
    this
        .doctors
        .add({"id": 3, "name": "Dr. Priya(170/1-5th Main Bangalore-560064)"});
    this
        .doctors
        .add({"id": 3, "name": "Dr. Rakesh(170/1-5th Main Bangalore-560064)"});
  }

  DateTime _dateTime = DateTime.now();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    babynameController.dispose();
    dobController.dispose();
    mobileController.dispose();
    addressController.dispose();
    genderController.dispose();
    relationController.dispose();
    doctorController.dispose();
    super.dispose();
  }

  clearText() {
    nameController.clear();
    babynameController.clear();
    dobController.clear();
    mobileController.clear();
    addressController.clear();
    genderController.clear();
    relationController.clear();
    doctorController.clear();
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2008),
            lastDate: DateTime(2023))
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  CollectionReference submittedform =
      FirebaseFirestore.instance.collection('forms');

  Future<void> addUser() {
    return submittedform
        .add({
          'name': name,
          'babyname': babyname,
          'mobile': mobile,
          'address': address,
          'gender': gender,
          'relation': relations,
          'doctor': doctor,
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Text(
              "Fill Out Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            style: TextStyle(color: kMainColor),
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Your Full Name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                fillColor: kTextColor,
                                labelText: "Parent Name",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                hintText: "Enter Your Full Name",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintStyle: TextStyle(color: kPrimaryLightColor),
                                labelStyle: TextStyle(
                                    color: kMainColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            style: TextStyle(color: kMainColor),
                            controller: babynameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Baby Name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                fillColor: kTextColor,
                                labelText: "Baby Name",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                hintText: "Enter Baby Full Name",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintStyle: TextStyle(color: kPrimaryLightColor),
                                labelStyle: TextStyle(
                                    color: kMainColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 30),
                          Center(
                            child: Column(
                              children: [
                                TextFormField(
                                    controller: dobController,
                                    enableInteractiveSelection: false,
                                    focusNode: AlwaysDisabledFocusNode(),
                                    decoration: InputDecoration(
                                        fillColor: kTextColor,
                                        labelText: "Baby DOB",
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        hintText: _dateTime.toString(),
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        hintStyle: TextStyle(color: kTextColor),
                                        labelStyle: TextStyle(
                                            color: kMainColor,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold))),
                                MaterialButton(
                                  onPressed: _showDatePicker,
                                  child: Text(
                                    "Choose Baby Date of Birth",
                                  ),
                                  color: kPrimaryColor,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            style: TextStyle(color: kPrimaryLightColor),
                            controller: mobileController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Your Mobile Number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                fillColor: kTextColor,
                                labelText: "Mobile Number",
                                hintText: "Enter Mobile Number",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintStyle: TextStyle(color: kPrimaryLightColor),
                                labelStyle: TextStyle(
                                    color: kMainColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.streetAddress,
                            style: TextStyle(color: kPrimaryLightColor),
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
                                hintStyle: TextStyle(color: kPrimaryLightColor),
                                labelStyle: TextStyle(
                                    color: kMainColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 20),
                          FormHelper.dropDownWidgetWithLabel(
                              context,
                              "Gender",
                              "Select Gender",
                              this.genderId,
                              this.genders, (onChangedVal) {
                            this.genderId = onChangedVal;
                          }, (onValidateVal) {
                            if (onValidateVal == null) {
                              return "Please Select Gender";
                            }
                            return null;
                          },
                              borderColor: Colors.black,
                              borderFocusColor: Colors.black,
                              borderRadius: 15),
                          const SizedBox(height: 10),
                          FormHelper.dropDownWidgetWithLabel(
                              context,
                              "I'm the Childs",
                              "Relationship with Child",
                              this.relationId,
                              this.relations, (onChangedVal) {
                            this.relationId = onChangedVal;
                          }, (onValidateVal) {
                            if (onValidateVal == null) {
                              return "Please Select Relation";
                            }
                            return null;
                          },
                              borderColor: Colors.black,
                              borderFocusColor: Colors.black,
                              borderRadius: 15),
                          const SizedBox(height: 30),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kPrimaryColor),
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: Column(
                              children: [
                                Text(
                                  "Make Appointment",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                FormHelper.dropDownWidgetWithLabel(
                                    context,
                                    "Doctor",
                                    "Select Doctor near You",
                                    this.doctorId,
                                    this.doctors, (onChangedVal) {
                                  this.doctorId = onChangedVal;
                                }, (onValidateVal) {
                                  if (onValidateVal == null) {
                                    return "Please Select Doctor";
                                  }
                                  return null;
                                },
                                    borderColor: Colors.black,
                                    borderFocusColor: Colors.black,
                                    borderRadius: 15),
                                const SizedBox(height: 20),
                                DefaultButton2(
                                  text: "Choose Your Slot",
                                  press: () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        name = nameController.text;
                                        babyname = babynameController.text;
                                        mobile = mobileController.text;
                                        address = addressController.text;
                                        gender = genderController.text;
                                        relation = relationController.text;
                                        doctor = doctorController.text;

                                        addUser();
                                        clearText();
                                      });
                                    }
                                    Navigator.pushNamed(context,
                                        BookingCalendarDemoApp.routeName);
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
