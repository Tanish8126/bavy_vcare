import 'package:flutter/material.dart';

import '../utils/enums.dart';
import '../utils/custtom_bottom_nav_bar.dart';
import '../utils/size_config.dart';

class MessageScreen extends StatefulWidget {
  static String routeName = '/messageing';
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chat with Doctors",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        child: Text("Coming Soon",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.message),
    );
  }
}
