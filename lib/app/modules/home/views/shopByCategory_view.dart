import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/common_text.dart';
import '../../../core/constant/common_method.dart';
import '../../../core/constant/size_constant.dart';
import '../../../core/constant/string_constant.dart';
import '../../../core/utils/extension/color_extension.dart';
import '../../../models/middle_model.dart';

class ShopByCategoryView extends StatefulWidget {
  final List<ShopByCategory>? shopByCategoryList;
  const ShopByCategoryView({super.key, this.shopByCategoryList});

  @override
  State<ShopByCategoryView> createState() => _ShopByCategoryViewState();
}

class _ShopByCategoryViewState extends State<ShopByCategoryView> {
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
        itemCount: widget.shopByCategoryList!.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: HexColor.fromHex(
                  widget.shopByCategoryList![index].tintColor!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 110.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.shopByCategoryList![index].image ??
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
                        widget.shopByCategoryList![index].name ?? ""),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: CommonText(
                      text: ConstString.exploreLabel,
                      fontSize: textSize10Px,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
