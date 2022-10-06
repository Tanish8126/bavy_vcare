// ignore_for_file: must_be_immutable, prefer_if_null_operators, unnecessary_null_comparison

import 'package:babyv_care/screens/succees_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../utils/constants.dart';
import '../../utils/dafault_button.dart';
import '../../utils/dafault_button2.dart';
import '../../utils/default_text_field.dart';

List<String> genders = <String>['Male', 'Female'];
List<String> relations = <String>['Father', 'Mother', 'Gaurdian'];
List<String> doctors = <String>['Dr. Batra', 'Dr. Suamn', 'Dr. Rahul'];

class AppointmentForm extends StatefulWidget {
  static String routeName = "/appointmentform";
  String babyage;
  String vaccine;
  AppointmentForm(this.babyage, this.vaccine, {Key? key}) : super(key: key);

  @override
  State<AppointmentForm> createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  final _formKey = GlobalKey<FormState>();
  var uuid = const Uuid();

  String genderValue = genders.first;
  String relationValue = relations.first;
  String doctorValue = doctors.first;

  var name = "";
  var babyname = "";
  var dob = "";
  var mobile = "";
  var address = "";
  var gender = "";
  var relation = "";
  var doctor = "";
  var vaccine = "";
  var babyage = "";

  final nameController = TextEditingController();
  final babynameController = TextEditingController();
  final dobController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    babynameController.dispose();
    dobController.dispose();
    mobileController.dispose();
    addressController.dispose();
    super.dispose();
  }

  clearText() {
    nameController.clear();
    babynameController.clear();
    dobController.clear();
    mobileController.clear();
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
          'vaccine': vaccine,
          'babyage': babyage,
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  @override
  Widget build(BuildContext context) {
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
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kPrimaryColor),
                      child: Column(
                        children: [
                          const Text("Selected Age",
                              style: TextStyle(
                                  color: kMainColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text(widget.babyage,
                              style: const TextStyle(
                                  color: kMainColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal)),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Selected Vaccine",
                              style: TextStyle(
                                  color: kMainColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Text(widget.vaccine,
                              style: const TextStyle(
                                  color: kMainColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Stack(children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Fill Out Details",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
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
                                      hintStyle:
                                          const TextStyle(color: Colors.black),
                                      labelStyle: const TextStyle(
                                          color: kMainColor,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold))),
                              Center(
                                child: MaterialButton(
                                  onPressed: _showDatePicker,
                                  color: kPrimaryColor,
                                  child: const Text(
                                    "Choose Baby Date of Birth",
                                  ),
                                ),
                              ),
                              const SizedBox(
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
                                prefix: const Padding(
                                  padding: EdgeInsets.all(4),
                                  child: Text('+91'),
                                ),
                                labeltext: "Mobile Number",
                              ),
                              const SizedBox(
                                height: 30,
                              ),
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
                                        color: kMainColor,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                              ),
                              const SizedBox(height: 30),
                              DropdownButtonFormField(
                                alignment: AlignmentDirectional.center,
                                items: genders.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                value: genderValue,
                                icon: const Icon(Icons.arrow_downward),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(color: kbg)),
                                    icon: const Icon(Icons.man_sharp),
                                    labelStyle: const TextStyle(
                                        color: kMainColor,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                    label: const Text("Select Gender")),
                                borderRadius: BorderRadius.circular(10),
                                elevation: 50,
                                hint: const Text(" Select gender"),
                                iconEnabledColor: Colors.black,
                                style: const TextStyle(color: Colors.black),
                                onChanged: (String? value) {
                                  setState(() {
                                    genderValue = value!;
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              DropdownButtonFormField(
                                alignment: AlignmentDirectional.center,
                                items: relations.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                value: relationValue,
                                isExpanded: true,
                                icon: const Icon(Icons.arrow_downward),
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: kbg)),
                                  prefixIcon: const Icon(Icons.man),
                                  labelStyle: const TextStyle(
                                      color: kMainColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                  label: const Text("Relationship with child"),
                                ),
                                elevation: 50,
                                hint: const Text(" Select gender"),
                                iconEnabledColor: Colors.black,
                                style: const TextStyle(color: Colors.black),
                                onChanged: (String? value) {
                                  setState(() {
                                    relationValue = value!;
                                  });
                                },
                              ),
                              const SizedBox(height: 30),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: kPrimaryColor),
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child: Column(
                                  children: [
                                    const Text(
                                      "Make Appointment",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 20),
                                    DropdownButtonFormField(
                                      items: doctors
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      value: doctorValue,
                                      isExpanded: true,
                                      decoration: const InputDecoration(
                                        prefixIcon:
                                            Icon(Icons.medication_outlined),
                                        labelStyle: TextStyle(
                                            color: kMainColor,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                        label: Text("Selact Doctor"),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      elevation: 50,
                                      hint: const Text(" Select gender"),
                                      iconEnabledColor: Colors.blue,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      onChanged: (String? value) {
                                        setState(() {
                                          doctorValue = value!;
                                        });
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    DefaultButton2(
                                        text: "Choose Your Slot", press: () {}),
                                    Text(uuid.v4()),
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
                                      gender = genderValue;
                                      relation = relationValue;
                                      doctor = doctorValue;
                                      vaccine = vaccine;
                                      babyage = babyage;
                                      addUser();
                                      clearText();
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SuccessScreen()));
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            )));
  }
}
