// ignore_for_file: non_constant_identifier_names

import 'package:babyv_care/utils/default_form_field.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/dafault_button.dart';
import '../../book_appointment/appointmentform.dart';
import '../../uploadscreen.dart';

class MainScreenForm extends StatefulWidget {
  static String routeName = "/mainscreenform";
  MainScreenForm({Key? key}) : super(key: key);

  @override
  State<MainScreenForm> createState() => _MainScreenFormState();
}

class _MainScreenFormState extends State<MainScreenForm> {
  final _formKey = GlobalKey<FormState>();

  String _selectedAge = "Birth";
  var age = {
    "Birth": '1',
    "6 Weeks": '2',
    "10 Weeks": '3',
    "14 Weeks": '4',
    "6 Months": '5',
    "6 Months Onwards": '6',
    "9 Months": '7',
    "12 Months": '8',
    "15 Months": '9',
    "16-18 Months": '10',
    "18 Months": '11',
    "4-6 Years": '12',
    "9-12 Years": '13',
  };

  final List _ages = [];
  AgeDependentDropDown() {
    age.forEach((key, value) {
      _ages.add(key);
    });
  }

  String _selectedVaccine = "";
  var vaccine = {
    "BCG": '1',
    "OPV 0": '1',
    "Hep-B1": '1',
    "DTwP 1": '2',
    "IPV 1": '2',
    "Hep-B2": '2',
    "Hib 1": '2',
    "Rotavirus 1": '2',
    "PCV 1": '2',
    "DTwP 2": '3',
    "IPV 2": '3',
    "Hib 2": '3',
    "Hep-B3": '3',
    "Rotavirus 2": '3',
    "PCV 2": '3',
    "DTwP 3": '4',
    "IPV 3": '4',
    "Hib 3": '4',
    "Hep-B4": '4',
    "Rotavirus 3": '4',
    "PCV 3": '4',
    "Influenza(FLU) Vaccine": '5',
    "Typhoid conjugate vacciene (TCV)": '6',
    "MMR-1/MR": '7',
    "Hep-A 1": '8',
    "MMR 2": '9',
    "Varicella 1": '9',
    "PCV Booster": '9',
    "DTwP B1/DTaP B1": '10',
    "IVP B1": '10',
    "Hib B1": '10',
    "Hep-A 2": '11',
    "DTwP B2/DTaP B2": '12',
    "MMRV or MMR3+Varicella 2": '12',
    "Tdap/Td": '13',
    "HPV": '13',
  };

  List _vaccines = [];
  VaccineDependentDropDown(AgeShortName) {
    vaccine.forEach((key, value) {
      if (AgeShortName == value) {
        _vaccines.add(key);
      }
    });
    _selectedVaccine = _vaccines[0];
  }

  @override
  void initState() {
    super.initState();
    AgeDependentDropDown();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            height: 700,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  DefaultFormField(
                    labeltext: "Select the baby's Age",
                    hinttext: "Select Age",
                    icon: const Icon(Icons.arrow_downward),
                    items: _ages.map((age) {
                      return DropdownMenuItem(
                        value: age,
                        child: Text(
                          age,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                    prefixicon: const Icon(Icons.man),
                    onChanged: (newValue) {
                      setState(() {
                        _vaccines = [];
                        VaccineDependentDropDown(age[newValue]);
                        _selectedAge = "$newValue";
                      });
                    },
                    validate: (value) =>
                        value == null ? 'field required' : null,
                    value: _selectedAge,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DefaultFormField(
                    labeltext: "Choose the required Vaccine",
                    hinttext: " Select Vaccine",
                    icon: const Icon(Icons.arrow_downward),
                    prefixicon: const Icon(Icons.man),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedVaccine = "$newValue";
                      });
                    },
                    items: _vaccines.map((vaccine) {
                      return DropdownMenuItem(
                        value: vaccine,
                        child: Text(
                          vaccine,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                    validate: (value) =>
                        value == null ? 'field required' : null,
                    value: _selectedVaccine,
                  ),
                  const SizedBox(height: 30),
                  DefaultButton(
                    text: "Book an Appointment",
                    press: () {
                      if (_formKey.currentState!.validate()) {
                        //valid flow
                      }
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              AppointmentForm(_selectedAge, _selectedVaccine)));
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultButton(
                    text: "Upload Document",
                    press: () {
                      Navigator.pushNamed(context, UploadScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
