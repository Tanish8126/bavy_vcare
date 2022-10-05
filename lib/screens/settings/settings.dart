import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/dafault_button.dart';
import '../../utils/enums.dart';
import '../../utils/custtom_bottom_nav_bar.dart';
import '../splash-to-home/sign_in_screen.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = "/settingscreen";
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final Mobile = FirebaseAuth.instance.currentUser!.phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: kPrimaryColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryLightColor),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "$Mobile",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryLightColor),
                )
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
              color: kMainColor,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Social", "nav"),
            buildAccountOptionRow(context, "Blog", "nav"),
            buildAccountOptionRow(context, "Privacy and security", "nav"),
            buildAccountOptionRow(context, "Share App", "nav"),
            buildAccountOptionRow(context, "Feedback & Review", "nav"),
            SizedBox(
              height: 40,
            ),
            Center(
              child: DefaultButton(
                press: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false);
                },
                text: "Sign Out",
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }

  GestureDetector buildAccountOptionRow(
      BuildContext context, String title, dynamic content) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  new TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: kPrimaryLightColor,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: kPrimaryLightColor,
            ),
          ],
        ),
      ),
    );
  }
}
