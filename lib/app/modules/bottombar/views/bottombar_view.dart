import 'package:easterninterview/app/core/constant/string_constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bottombar_controller.dart';

class BottombarView extends GetView<BottombarController> {
  const BottombarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(BottombarController());
    return GetBuilder<BottombarController>(builder: (_) {
      return Scaffold(
        body: Center(
          child: controller.screens.elementAt(controller.selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(color: Colors.amberAccent),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: ConstString.homeLabel,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted),
              label: ConstString.categoryLabel,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: ConstString.curateLabel,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bolt_outlined),
              label: ConstString.saleLabel,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_outlined),
              label: ConstString.moreLabel,
            ),
          ],
          currentIndex: controller.selectedIndex,
          selectedItemColor: Colors.amberAccent,
          onTap: controller.onItemTapped,
        ),
      );
    });
  }
}
