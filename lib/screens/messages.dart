import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/enums.dart';
import '../utils/custtom_bottom_nav_bar.dart';

class MessageScreen extends StatefulWidget {
  static String routeName = '/messageing';
  MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat with Doctors",
        ),
        backgroundColor: kMainColor2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Text("Coming Soon",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.message),
    );
  }
}
