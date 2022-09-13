import 'package:babyv_care/screens/mainscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../utils/constants.dart';
import '../utils/dafault_button.dart';
import '../utils/size_config.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/homescreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  var name = "";
  var gender = "";
  var password = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  final relationController = TextEditingController();

  List<dynamic> genders = [];
  List<dynamic> relations = [];

  String? genderId;
  String? relationId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.genders.add({"id": 1, "name": "Male"});
    this.genders.add({"id": 2, "name": "Female"});
    this.relations.add({"id": 1, "name": "Father"});
    this.relations.add({"id": 2, "name": "Mother"});
    this.relations.add({"id": 3, "name": "Gaurdian"});
  }

  DateTime _dateTime = DateTime.now();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    genderController.dispose();
    relationController.dispose();
    super.dispose();
  }

  clearText() {
    nameController.clear();
    genderController.clear();
    relationController.clear();
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
        .add({'name': name, 'gender': gender, 'relation': relations})
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Text(
                  "Create Baby Profile",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                ),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Stack(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                        )),
                        Positioned(
                            child: Container(
                          padding: EdgeInsets.all(10),
                          height: 700,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 30),
                                Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.name,
                                    style: TextStyle(color: kMainColor),
                                    controller: nameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Name';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        fillColor: kTextColor,
                                        labelText: "Baby Name",
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        hintText: "Enter Baby Full Name",
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        hintStyle: TextStyle(
                                            color: kPrimaryLightColor),
                                        labelStyle: TextStyle(
                                            color: kMainColor,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Center(
                                  child: Column(
                                    children: [
                                      Text(_dateTime.toString()),
                                      MaterialButton(
                                        onPressed: _showDatePicker,
                                        child: Text(
                                          "Baby Date of Birth",
                                        ),
                                        color: kPrimaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
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
                                const SizedBox(height: 10),
                                DefaultButton(
                                  text: "Submit",
                                  press: () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        name = nameController.text;

                                        addUser();
                                        clearText();
                                      });
                                    }
                                    Navigator.pushNamed(
                                        context, MainScreen.routeName);
                                  },
                                ),
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
