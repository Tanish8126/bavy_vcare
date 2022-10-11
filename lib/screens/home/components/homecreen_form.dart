// ignore_for_file: non_constant_identifier_names

import 'package:babyv_care/utils/default_form_field.dart';
import 'package:flutter/material.dart';

import '../../../utils/dafault_button.dart';
import '../../../utils/size_config.dart';
import '../../book_appointment/appointmentform.dart';

class HomeScreenForm extends StatefulWidget {
  static String routeName = "/mainscreenform";
  const HomeScreenForm({Key? key}) : super(key: key);

  @override
  State<HomeScreenForm> createState() => _HomeScreenFormState();
}

class _HomeScreenFormState extends State<HomeScreenForm> {
  final _formKey = GlobalKey<FormState>();

  String _selectedAge = "Select Baby's Age";
  var age = {
    "Select Baby's Age": '0',
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
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            height: SizeConfig.screenHeight * 0.5,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.035),
                  DefaultFormField(
                    labeltext: "Select Baby's Age",
                    hinttext: "Select Age",
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
                  SizedBox(height: SizeConfig.screenHeight * 0.035),
                  DefaultFormField(
                    labeltext: "Choose Vaccine",
                    hinttext: " Select Vaccine",
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
                  SizedBox(height: SizeConfig.screenHeight * 0.025),
                  DefaultButton(
                    text: "Book an Appointment",
                    press: () {
                      if (_formKey.currentState!.validate()) {
                        //valid flow
                        setState(() {
                          _selectedAge;
                          _selectedVaccine;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AppointmentForm(
                                  _selectedAge, _selectedVaccine)));
                        });
                      }
                    },
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.025),
                  DefaultButton(
                    text: "Upload Document",
                    press: () {},
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
