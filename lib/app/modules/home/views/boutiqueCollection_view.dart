import 'package:carousel_slider/carousel_slider.dart';
import 'package:easterninterview/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common_widgets/common_text.dart';
import '../../../core/constant/size_constant.dart';
import '../../../core/them/const_color.dart';
import '../../../models/middle_model.dart';

class BoutiqueCollectionView extends StatefulWidget {
  final List<BoutiqueCollection>? boutiqueCollectionData;
  const BoutiqueCollectionView({super.key, this.boutiqueCollectionData});

  @override
  State<BoutiqueCollectionView> createState() => _BoutiqueCollectionViewState();
}

class _BoutiqueCollectionViewState extends State<BoutiqueCollectionView> {
  var homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        children: [
          SizedBox(
            // height: 400.h,
            child: CarouselSlider.builder(
              itemCount: widget.boutiqueCollectionData!.length,
              options: CarouselOptions(
                viewportFraction: 1,
                height: 500.h,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  // setState(() {
                  homeController.current = index;
                  homeController.update();
                  // });
                },
              ),
              itemBuilder: (context, index, realIdx) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget
                                    .boutiqueCollectionData![index]
                                    .bannerImage ??
                                "http://via.placeholder.com/350x150"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 4.h,
                                left: 20.w,
                                right: 20.w,
                                bottom: 10.h),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: CommonText(
                                text: widget
                                        .boutiqueCollectionData![index].name ??
                                    "",
                                fontSize: textSize30Px,
                                fontWeight: FontWeight.bold,
                                fontColor: ConstColor.whiteColor,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.w, right: 20.w, bottom: 20.h),
                          child: CommonText(
                            text:
                                widget.boutiqueCollectionData![index].cta ?? "",
                            fontSize: textSize16Px,
                            fontColor: ConstColor.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                widget.boutiqueCollectionData!.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => homeController.controller.animateToPage(entry.key),
                child: Container(
                  width: homeController.current == entry.key ? 12.h : 8.h,
                  height: homeController.current == entry.key ? 12.h : 8.h,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(
                              homeController.current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
