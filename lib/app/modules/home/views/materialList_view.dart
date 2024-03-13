import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common_widgets/common_text.dart';
import '../../../core/constant/size_constant.dart';
import '../../../core/constant/sized_box_const.dart';
import '../../../models/top_model.dart';

class MaterialListView extends StatefulWidget {
  final TopModel? materialList;
  const MaterialListView({super.key, this.materialList});

  @override
  State<MaterialListView> createState() => _MaterialListViewState();
}

class _MaterialListViewState extends State<MaterialListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 134.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                itemBuilder: (context, index) {
                  return Container(
                    width: 180.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(1, 2),
                              blurRadius: 4,
                              color: Colors.grey,
                              spreadRadius: 1)
                        ]),
                    child: Column(
                      children: [
                        Container(
                          height: 80.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.r),
                                topRight: Radius.circular(4.r)),
                            image: DecorationImage(
                              image: NetworkImage(
                                widget.materialList!.main_sticky_menu![index]
                                        .image ??
                                    "http://via.placeholder.com/350x150",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 4.h),
                          child: CommonText(
                            text: widget.materialList!.main_sticky_menu![index]
                                    .title ??
                                "",
                            fontWeight: FontWeight.w700,
                            fontSize: textSize16Px,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return sizedBoxWidth20;
                },
                itemCount: widget.materialList!.main_sticky_menu!.length),
          ),
        ],
      ),
    );
  }
}
