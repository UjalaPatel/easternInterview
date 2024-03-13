import 'package:easterninterview/app/core/them/const_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/common_text.dart';
import '../../../core/constant/common_method.dart';
import '../../../core/constant/size_constant.dart';
import '../../../models/bottom_model.dart';

class DesignAsPerOccasionView extends StatefulWidget {
  final List<DesignOccasion>? designOccasionList;
  const DesignAsPerOccasionView({super.key, this.designOccasionList});

  @override
  State<DesignAsPerOccasionView> createState() =>
      _DesignAsPerOccasionViewState();
}

class _DesignAsPerOccasionViewState extends State<DesignAsPerOccasionView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.h,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 10.0, // spacing between rows
          crossAxisSpacing: 10.0, // spacing between columns
        ),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
            horizontal: 20.w, vertical: 10.h), // padding around the grid
        itemCount: widget.designOccasionList!.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
              color: ConstColor.borderColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 110.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.designOccasionList![index].image ??
                            "http://via.placeholder.com/350x150",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 4.h, left: 10.w, right: 10.w),
                    child: buildRichText(
                        widget.designOccasionList![index].name ?? ""),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: CommonText(
                          text: widget.designOccasionList![index].subName ?? "",
                          fontSize: textSize10Px,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: CommonText(
                        text: widget.designOccasionList![index].cta ?? "",
                        fontSize: textSize10Px,
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
