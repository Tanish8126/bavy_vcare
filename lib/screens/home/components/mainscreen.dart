import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import '../../../utils/dafault_button.dart';
import '../../../utils/size_config.dart';
import '../../book_appointment/appointmentform.dart';
import '../../uploadscreen.dart';

class MainScreenForm extends StatefulWidget {
  static String routeName = "/mainscreenform";
  MainScreenForm({Key? key}) : super(key: key);

  @override
  State<MainScreenForm> createState() => _MainScreenFormState();
}

class _MainScreenFormState extends State<MainScreenForm> {
  List<dynamic> age = [];
  List<dynamic> vaccineMasters = [];
  List<dynamic> vaccines = [];

  String? ageId;
  String? vaccineId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.age.add({"id": 1, "name": "Birth"});
    this.age.add({"id": 2, "name": "6 Weeks"});
    this.age.add({"id": 3, "name": "10 Weeks"});
    this.age.add({"id": 4, "name": "14 Weeks"});
    this.age.add({"id": 5, "name": "6 Months"});
    this.age.add({"id": 6, "name": "6 Months Onwards"});
    this.age.add({"id": 7, "name": "9 Months"});
    this.age.add({"id": 8, "name": "12 Months"});
    this.age.add({"id": 9, "name": "15 Months"});
    this.age.add({"id": 10, "name": "16-18 Months"});
    this.age.add({"id": 11, "name": "18 Months"});
    this.age.add({"id": 12, "name": "4-6 Years"});
    this.age.add({"id": 13, "name": "9-12 Years"});

    this.vaccineMasters = [
      {"Id": 1, "name": "BCG", "ParentId": 1},
      {"Id": 2, "name": "OPV 0", "ParentId": 1},
      {"Id": 3, "name": "Hep-B1", "ParentId": 1},
      {"Id": 1, "name": "DTwP 1", "ParentId": 2},
      {"Id": 2, "name": "IPV 1", "ParentId": 2},
      {"Id": 3, "name": "Hep-B2", "ParentId": 2},
      {"Id": 4, "name": "Hib 1", "ParentId": 2},
      {"Id": 5, "name": "Rotavirus 1", "ParentId": 2},
      {"Id": 6, "name": "PCV 1", "ParentId": 2},
      {"Id": 1, "name": "DTwP 2", "ParentId": 3},
      {"Id": 2, "name": "IPV 2", "ParentId": 3},
      {"Id": 3, "name": "Hib 2", "ParentId": 3},
      {"Id": 4, "name": "Hep-B3", "ParentId": 3},
      {"Id": 5, "name": "Rotavirus 2", "ParentId": 3},
      {"Id": 6, "name": "PCV 2", "ParentId": 3},
      {"Id": 1, "name": "DTwP 3", "ParentId": 4},
      {"Id": 2, "name": "IPV 3", "ParentId": 4},
      {"Id": 3, "name": "Hib 3", "ParentId": 4},
      {"Id": 4, "name": "Hep-B4", "ParentId": 4},
      {"Id": 5, "name": "Rotavirus 3", "ParentId": 4},
      {"Id": 6, "name": "PCV 3", "ParentId": 4},
      {"Id": 1, "name": "Influenza(FLU) Vaccine", "ParentId": 5},
      {"Id": 1, "name": "Typhoid conjugate vacciene(TCV)", "ParentId": 6},
      {"Id": 1, "name": "MMR-1/MR", "ParentId": 7},
      {"Id": 1, "name": "Hep-A 1", "ParentId": 8},
      {"Id": 1, "name": "MMR 2", "ParentId": 9},
      {"Id": 2, "name": "Varicella 1", "ParentId": 9},
      {"Id": 3, "name": "PCV Booster", "ParentId": 9},
      {"Id": 1, "name": "DTwP B1/DTaP B1", "ParentId": 10},
      {"Id": 2, "name": "IVP B1", "ParentId": 10},
      {"Id": 3, "name": "Hib B1", "ParentId": 10},
      {"Id": 1, "name": "Hep-A 2", "ParentId": 11},
      {"Id": 1, "name": "DTwP B2/DTaP B2", "ParentId": 12},
      {"Id": 2, "name": "MMRV or MMR3+Varicella 2", "ParentId": 12},
      {"Id": 1, "name": "Tdap/Td", "ParentId": 13},
      {"Id": 2, "name": "HPV", "ParentId": 13},
    ];
    this.vaccineId = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          height: 700,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                FormHelper.dropDownWidgetWithLabel(
                    context, "Age", "Select Baby Age", this.ageId, this.age,
                    (onChangedVal) {
                  this.ageId = onChangedVal;
                  print("$onChangedVal");

                  this.vaccines = this
                      .vaccineMasters
                      .where((vaccineItem) =>
                          vaccineItem["ParentId"].toString() ==
                          onChangedVal.toString())
                      .toList();
                  this.vaccineId = null;
                }, (onValidateVal) {
                  if (onValidateVal == null) {
                    return "Please Select Age";
                  }
                  return null;
                },
                    borderColor: Colors.black,
                    borderFocusColor: Colors.black,
                    borderRadius: 15),
                const SizedBox(height: 10),
                FormHelper.dropDownWidgetWithLabel(
                    context,
                    "Vaccines",
                    "Select The Vaccine",
                    this.vaccineId,
                    this.vaccines, (onChangedVal) {
                  this.vaccineId = onChangedVal;
                }, (onValidateVal) {
                  if (onValidateVal == null) {
                    return "Please Select Relation";
                  }
                  return null;
                },
                    borderColor: Colors.black,
                    borderFocusColor: Colors.black,
                    borderRadius: 15,
                    optionLabel: "name",
                    optionValue: 'Id'),
                const SizedBox(height: 20),
                DefaultButton(
                  text: "Book an Appointment",
                  press: () {
                    Navigator.pushNamed(context, AppointmentForm.routeName);
                  },
                ),
                SizedBox(
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
    );
  }
}
