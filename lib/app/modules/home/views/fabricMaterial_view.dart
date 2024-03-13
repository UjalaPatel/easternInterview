import 'package:easterninterview/app/core/them/const_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/common_text.dart';
import '../../../core/constant/size_constant.dart';
import '../../../core/utils/extension/color_extension.dart';
import '../../../models/middle_model.dart';

class FabricMaterialView extends StatefulWidget {
  final List<ShopByFabric>? shopByFabricList;
  const FabricMaterialView({super.key, this.shopByFabricList});

  @override
  State<FabricMaterialView> createState() => _FabricMaterialViewState();
}

class _FabricMaterialViewState extends State<FabricMaterialView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 8.0, // spacing between rows
          crossAxisSpacing: 8.0, // spacing between columns
        ),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
            horizontal: 20.w, vertical: 10.h), // padding around the grid
        itemCount: widget.shopByFabricList!.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                height: 130.h,
                width: 130.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: HexColor.fromHex(
                      widget.shopByFabricList![index].tintColor!),
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.shopByFabricList![index].image ??
                          "http://via.placeholder.com/350x150",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: CommonText(
                  text: widget.shopByFabricList![index].name ?? "",
                  fontSize: textSize20Px,
                  fontColor: ConstColor.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
