import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../common_widgets/common_app_bar_widget.dart';
import '../../../common_widgets/common_text.dart';
import '../../../core/constant/size_constant.dart';
import '../../../core/constant/string_constant.dart';
import '../../../core/them/const_color.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryController());

    return GetBuilder<CategoryController>(
      builder: (_) {
        return Scaffold(
          appBar: CommonAppBar(
            title: CommonText(
              text: ConstString.categoryTitleLabel,
              fontColor: ConstColor.greyColor,
              fontWeight: FontWeight.bold,
              fontSize: textSize18Px,
            ),
            isCenter: true,
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
          body: controller.categoryList == null
              ? Center(
                  child: CommonText(
                    text: "No data found",
                    fontWeight: FontWeight.bold,
                    fontSize: textSize26Px,
                  ),
                )
              : ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  itemBuilder: (context, index) {
                    return ExpandableNotifier(
                      initialExpanded: true,
                      child: ExpandablePanel(
                        header: Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: 150.h,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        controller.categoryData?.bannerImage ??
                                            "http://via.placeholder.com/350x150",
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              child: Center(
                                child: Container(
                                  height: 210.h,
                                  width: 240.w,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple.shade100,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(100.r),
                                      bottomRight: Radius.circular(100.r),
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 6,
                                          spreadRadius: 4,
                                          offset: Offset(-1, 1))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20.w),
                                child: CommonText(
                                  text: controller
                                          .categoryList?[index].categoryName ??
                                      "",
                                  textAlign: TextAlign.start,
                                  fontSize: textSize22Px,
                                  fontColor: ConstColor.blackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        collapsed: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 4.h),
                              itemBuilder: (context, idx) {
                                return CommonText(
                                  text: controller.categoryList![index]
                                          .child![idx].categoryName ??
                                      "",
                                  fontSize: textSize16Px,
                                  fontWeight: FontWeight.w700,
                                  overflow: TextOverflow.ellipsis,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                              itemCount:
                                  controller.categoryList![index].child!.length,
                            ),
                          ],
                        ),
                        expanded: const SizedBox(),
                        theme: const ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          hasIcon: false,
                          tapHeaderToExpand: true,
                          fadeCurve: Curves.bounceInOut,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 1,
                    );
                  },
                  itemCount: controller.categoryList!.length),
        );
      },
    );
  }
}
