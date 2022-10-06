import 'package:babyv_care/utils/default_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/dafault_button.dart';
import '../../../utils/dafault_button2.dart';

List<String> genders = <String>['Male', 'Female'];
List<String> relations = <String>['Father', 'Mother', 'Gaurdian'];

class AppForm extends StatefulWidget {
  AppForm({Key? key}) : super(key: key);

  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  final _formKey = GlobalKey<FormState>();

  String dropdownValue1 = genders.first;
  String dropdownValue2 = relations.first;

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
          'relation': relation,
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Text(
              "Fill Out Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        DefaultField(
                          controller: nameController,
                          keyboardtype: TextInputType.name,
                          maxlength: null,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Full Name';
                            }
                            return null;
                          },
                          labeltext: "Parent Name",
                          hinttext: "Enter Your Full Name",
                        ),
                        const SizedBox(height: 30),
                        DefaultField(
                          controller: babynameController,
                          keyboardtype: TextInputType.name,
                          maxlength: null,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Baby Name';
                            }
                            return null;
                          },
                          hinttext: "Enter Baby Full Name",
                          labeltext: "Baby Name",
                        ),
                        const SizedBox(height: 30),
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
                                hintStyle: TextStyle(color: Colors.black),
                                labelStyle: TextStyle(
                                    color: kMainColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold))),
                        Center(
                          child: MaterialButton(
                            onPressed: _showDatePicker,
                            child: Text(
                              "Choose Baby Date of Birth",
                            ),
                            color: kPrimaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
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
                          labeltext: "Mobile Number",
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
                        const SizedBox(height: 30),
                        DropdownButtonFormField(
                          alignment: AlignmentDirectional.center,
                          items: genders
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: dropdownValue1,
                          icon: const Icon(Icons.arrow_downward),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kbg)),
                              icon: const Icon(Icons.man_sharp),
                              labelStyle: TextStyle(
                                  color: kMainColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                              label: Text("Select Gender")),
                          borderRadius: BorderRadius.circular(10),
                          elevation: 50,
                          hint: Text(" Select gender"),
                          iconEnabledColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue1 = value!;
                            });
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        DropdownButtonFormField(
                          alignment: AlignmentDirectional.center,
                          items: relations
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: dropdownValue2,
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_downward),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kbg)),
                            prefixIcon: Icon(Icons.man),
                            labelStyle: TextStyle(
                                color: kMainColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                            label: Text("Relationship with child"),
                          ),
                          elevation: 50,
                          hint: Text(" Select gender"),
                          iconEnabledColor: Colors.black,
                          style: const TextStyle(color: Colors.black),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue2 = value!;
                            });
                          },
                        ),
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
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 20),
                              DropdownButtonFormField(
                                items: relations.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                value: dropdownValue2,
                                isExpanded: true,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.medication_outlined),
                                  labelStyle: TextStyle(
                                      color: kMainColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                  label: Text("Selact Doctor"),
                                ),
                                borderRadius: BorderRadius.circular(10),
                                elevation: 50,
                                hint: Text(" Select gender"),
                                iconEnabledColor: Colors.blue,
                                style: const TextStyle(color: Colors.black),
                                onChanged: (String? value) {
                                  setState(() {
                                    dropdownValue2 = value!;
                                  });
                                },
                              ),
                              const SizedBox(height: 20),
                              DefaultButton2(
                                  text: "Choose Your Slot", press: () {}),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        DefaultButton(
                          text: "Confirm Booking",
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
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
