import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../common_widgets/common_app_bar_widget.dart';
import '../../../common_widgets/common_text.dart';
import '../../../core/constant/size_constant.dart';
import '../../../core/constant/sized_box_const.dart';
import '../../../core/constant/string_constant.dart';
import '../../../core/them/const_color.dart';
import '../controllers/home_controller.dart';
import 'bannerList_view.dart';
import 'boutiqueCollection_view.dart';
import 'designAsPerOccation_view.dart';
import 'fabricMaterial_view.dart';
import 'materialList_view.dart';
import 'rangeOfPattern_view.dart';
import 'shopByCategory_view.dart';
import 'unstitched_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(builder: (_) {
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
        body: SingleChildScrollView(
          child: (controller.materialData == null &&
                  controller.shopByCategoryData == null &&
                  controller.rangeOfPatternData == null)
              ? Align(
                  alignment: Alignment.center,
                  child: CommonText(
                    text: "No data found",
                    fontWeight: FontWeight.bold,
                    fontSize: textSize26Px,
                    textAlign: TextAlign.center,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    controller.materialData != null
                        ? MaterialListView(
                            materialList: controller.materialData,
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                    controller.materialData != null
                        ? BannerListView(
                            slidingImage:
                                controller.materialData!.main_sticky_menu,
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CommonText(
                        text: ConstString.shopByCategoryLabel,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize20Px,
                      ),
                    ),
                    controller.shopByCategoryData != null
                        ? ShopByCategoryView(
                            shopByCategoryList:
                                controller.shopByCategoryData!.shopByCategory,
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CommonText(
                        text: ConstString.shopByFabricMaterialLabel,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize20Px,
                      ),
                    ),
                    controller.shopByCategoryData != null
                        ? FabricMaterialView(
                            shopByFabricList:
                                controller.shopByCategoryData!.shopByFabric,
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CommonText(
                        text: ConstString.unstitchedLabel,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize20Px,
                      ),
                    ),
                    controller.shopByCategoryData != null
                        ? UnstitchedView(
                            unstitchedList:
                                controller.shopByCategoryData!.unstitched,
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CommonText(
                        text: ConstString.boutiqueCollectionLabel,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize20Px,
                      ),
                    ),
                    controller.shopByCategoryData != null
                        ? BoutiqueCollectionView(
                            boutiqueCollectionData: controller
                                .shopByCategoryData!.boutiqueCollection,
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CommonText(
                        text: ConstString.rangeOfPatternLabel,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize20Px,
                      ),
                    ),
                    controller.rangeOfPatternData != null
                        ? RangeOfPatternView(
                            rangeOfPatternList:
                                controller.rangeOfPatternData!.rangeOfPattern,
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CommonText(
                        text: ConstString.designAsPerOccasionLabel,
                        fontWeight: FontWeight.bold,
                        fontSize: textSize20Px,
                      ),
                    ),
                    controller.rangeOfPatternData != null
                        ? DesignAsPerOccasionView(
                            designOccasionList:
                                controller.rangeOfPatternData!.designOccasion,
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                    sizedBox10,
                  ],
                ),
        ),
      );
    });
  }
}
