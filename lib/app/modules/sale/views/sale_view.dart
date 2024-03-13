import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../common_widgets/common_app_bar_widget.dart';
import '../../../common_widgets/common_text.dart';
import '../../../core/constant/size_constant.dart';
import '../../../core/constant/string_constant.dart';
import '../../../core/them/const_color.dart';
import '../controllers/sale_controller.dart';

class SaleView extends GetView<SaleController> {
  const SaleView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Image.asset(
          "assets/logo.webp",
          width: 180,
        ),
        isCenter: false,
        action: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: ConstColor.greyColor,
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: ConstColor.greyColor,
                ),
              ),
              Positioned(
                right: 8,
                top: 2,
                child: Container(
                  height: 20.h,
                  width: 20.h,
                  decoration: BoxDecoration(
                    color: ConstColor.greyColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: CommonText(
                      text: "1",
                      fontSize: textSize14Px,
                      fontColor: ConstColor.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bolt_outlined,
              size: 40.h,
            ),
            CommonText(
              text: ConstString.saleLabel,
              fontSize: textSize20Px,
              fontColor: ConstColor.blackColor,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
