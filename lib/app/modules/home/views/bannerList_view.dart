import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easterninterview/app/core/them/const_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/common_text.dart';
import '../../../core/constant/size_constant.dart';
import '../../../core/constant/string_constant.dart';

class BannerListView extends StatefulWidget {
  final List? slidingImage;
  const BannerListView({
    super.key,
    this.slidingImage,
  });

  @override
  _BannerListViewState createState() => _BannerListViewState();
}

class _BannerListViewState extends State<BannerListView> {
  sortData() {
    return widget.slidingImage!
        .sort((a, b) => a.sort_order!.compareTo(b.sort_order!));
  }

  @override
  Widget build(BuildContext context) {
    sortData();
    return SizedBox(
      height: 230.h,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: CarouselSlider.builder(
          options: CarouselOptions(
            height: 400.h,
            enlargeCenterPage: true,
          ),
          itemCount: widget.slidingImage!.length,
          itemBuilder: (context, index, realIdx) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)]
                          .shade100,
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Stack(
                    children: [
                      Container(
                        height: 150.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.r),
                              topRight: Radius.circular(4.r)),
                          image: DecorationImage(
                            image: NetworkImage(
                              widget.slidingImage![index].slider_images[index]
                                      .image ??
                                  "http://via.placeholder.com/350x150",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 40,
                        right: 40,
                        bottom: 10,
                        child: Container(
                          height: 100.h,
                          color: ConstColor.whiteColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: CommonText(
                                  text: widget.slidingImage![index]
                                          .slider_images[index].title ??
                                      "",
                                  fontColor: Colors.black54,
                                  fontSize: textSize14Px,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              CommonText(
                                text: ConstString.staticTextLabel,
                                fontWeight: FontWeight.normal,
                                fontColor: Colors.black54,
                                fontSize: textSize14Px,
                              ),
                              CommonText(
                                text: widget.slidingImage![index]
                                        .slider_images[index].cta ??
                                    "",
                                fontSize: textSize10Px,
                                fontColor: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
