import 'package:carousel_slider/carousel_slider.dart';
import 'package:easterninterview/app/core/them/const_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/common_text.dart';
import '../../../core/constant/size_constant.dart';
import '../../../models/middle_model.dart';

class UnstitchedView extends StatefulWidget {
  final List<Unstitched>? unstitchedList;
  const UnstitchedView({super.key, this.unstitchedList});

  @override
  State<UnstitchedView> createState() => _UnstitchedViewState();
}

class _UnstitchedViewState extends State<UnstitchedView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: SizedBox(
        height: 400.h,
        child: CarouselSlider.builder(
          itemCount: widget.unstitchedList!.length,
          options: CarouselOptions(
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            autoPlay: true,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            enlargeFactor: 0.4,
            // viewportFraction: 0.7,
          ),
          itemBuilder: (ctx, index, realIdx) {
            return Stack(
              children: [
                Container(
                  height: 400.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.unstitchedList![index].image ??
                            "http://via.placeholder.com/350x150",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 4.h, left: 20.w, right: 20.w, bottom: 10.h),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: CommonText(
                            text:
                                widget.unstitchedList![index].description ?? "",
                            fontSize: textSize16Px,
                            fontColor: ConstColor.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10.w, right: 10.w, bottom: 20.h),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CommonText(
                          text: widget.unstitchedList![index].name ?? "",
                          fontSize: textSize30Px,
                          fontWeight: FontWeight.bold,
                          fontColor: ConstColor.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
