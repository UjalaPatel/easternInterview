import 'package:easterninterview/app/modules/curate/views/curate_view.dart';
import 'package:easterninterview/app/modules/more/views/more_view.dart';
import 'package:easterninterview/app/modules/sale/views/sale_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../category/views/category_view.dart';
import '../../home/views/home_view.dart';

class BottombarController extends GetxController {
  int selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> screens = <Widget>[
    const HomeView(),
    const CategoryView(),
    const CurateView(),
    const SaleView(),
    const MoreView(),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }
}
