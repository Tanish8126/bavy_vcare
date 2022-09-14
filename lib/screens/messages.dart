import 'package:flutter/material.dart';

import '../utils/enums.dart';
import 'custtom_bottom_nav_bar.dart';

class messages extends StatefulWidget {
  messages({Key? key}) : super(key: key);

  @override
  State<messages> createState() => _messagesState();
}

class _messagesState extends State<messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.message),
    );
  }
}
