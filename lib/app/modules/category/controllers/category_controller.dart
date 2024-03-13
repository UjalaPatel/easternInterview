import 'package:expandable/expandable.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as diopackage;
import '../../../../services/api_services.dart';
import '../../../core/constant/const_api_url.dart';
import '../../../models/category_model.dart';

class CategoryController extends GetxController {
  List<Categories>? categoryList;
  CategoryModel? categoryData;

  // static bool isOpened = false;
  //
  // ExpandableController additionalInfoController = ExpandableController(
  //   initialExpanded: isOpened,
  // );

  @override
  void onInit() {
    super.onInit();
    getCategoryData();
  }

  getCategoryData() async {
    diopackage.Response finalData = await APIServices.getMethodWithoutHeaderDio(
      apiUrl: ConstApiUrl.categoryApiUrl,
    );
    CategoryModel categoryResponse = CategoryModel.fromJson(finalData.data);
    categoryData = categoryResponse;
    categoryList = categoryResponse.categories;
    update();
  }
}
