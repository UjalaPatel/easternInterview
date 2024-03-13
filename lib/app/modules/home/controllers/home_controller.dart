import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart' as diopackage;
import 'package:get/get.dart';
import '../../../../services/api_services.dart';
import '../../../core/constant/const_api_url.dart';
import '../../../models/bottom_model.dart';
import '../../../models/middle_model.dart';
import '../../../models/top_model.dart';

class HomeController extends GetxController {
  TopModel? materialData;
  MiddleModel? shopByCategoryData;
  BottomModel? rangeOfPatternData;

  int current = 0;
  final CarouselController controller = CarouselController();

  @override
  void onInit() {
    super.onInit();
    getMaterialData();
    getShopByCategoryData();
    getRangeOfPatternData();
  }

  getMaterialData() async {
    diopackage.Response finalData = await APIServices.getMethodWithoutHeaderDio(
      apiUrl: ConstApiUrl.topApiUrl,
    );
    TopModel materialResponse = TopModel.fromJson(finalData.data);

    materialResponse.main_sticky_menu!
        .sort((a, b) => a.sort_order!.compareTo(b.sort_order!));

    materialData = materialResponse;
    update();
  }

  getShopByCategoryData() async {
    diopackage.Response shopByCatData =
        await APIServices.getMethodWithoutHeaderDio(
      apiUrl: ConstApiUrl.middleApiUrl,
    );
    MiddleModel shopByCategoryResponse =
        MiddleModel.fromJson(shopByCatData.data);

    shopByCategoryResponse.shopByCategory!
        .sort((a, b) => a.sortOrder!.compareTo(b.sortOrder!));

    shopByCategoryData = shopByCategoryResponse;
    update();
  }

  getRangeOfPatternData() async {
    diopackage.Response rangeData = await APIServices.getMethodWithoutHeaderDio(
      apiUrl: ConstApiUrl.bottomApiUrl,
    );

    BottomModel rangeOfPatternResponse = BottomModel.fromJson(rangeData.data);

    rangeOfPatternData = rangeOfPatternResponse;
    update();
  }
}
