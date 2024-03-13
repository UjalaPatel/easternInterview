import '../core/constant/key_constant.dart';

class TopModel {
  final List<MainStickyMenu>? main_sticky_menu;
  final String? message;
  final String? status;

  TopModel({this.main_sticky_menu, this.message, this.status});

  factory TopModel.fromJson(Map<String, dynamic> json) {
    return TopModel(
      main_sticky_menu: json[kMainStickyMenu] != null
          ? (json[kMainStickyMenu] as List)
              .map((i) => MainStickyMenu.fromJson(i))
              .toList()
          : null,
      message: json[kMessage],
      status: json[kStatus],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[kMessage] = message;
    data[kStatus] = status;
    if (main_sticky_menu != null) {
      data[kMainStickyMenu] = main_sticky_menu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MainStickyMenu {
  final String? image;
  final List<SliderImage>? slider_images;
  final String? sort_order;
  final String? title;

  MainStickyMenu({this.image, this.slider_images, this.sort_order, this.title});

  factory MainStickyMenu.fromJson(Map<String, dynamic> json) {
    return MainStickyMenu(
      image: json[kImage],
      slider_images: json[kSliderImages] != null
          ? (json[kSliderImages] as List)
              .map((i) => SliderImage.fromJson(i))
              .toList()
          : null,
      sort_order: json[kSortOrder],
      title: json[kTitle],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[kImage] = image;
    data[kSortOrder] = sort_order;
    data[kTitle] = title;
    if (slider_images != null) {
      data[kSliderImages] = slider_images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OfferCodeBanner {
  final String? banner_image;
  final String? type;

  OfferCodeBanner({this.banner_image, this.type});

  factory OfferCodeBanner.fromJson(Map<String, dynamic> json) {
    return OfferCodeBanner(
      banner_image: json[kBannerImage],
      type: json[kType],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[kBannerImage] = banner_image;
    data[kType] = type;
    return data;
  }
}

class SliderImage {
  final String? cta;
  final String? image;
  final String? sort_order;
  final String? title;

  SliderImage({this.cta, this.image, this.sort_order, this.title});

  factory SliderImage.fromJson(Map<String, dynamic> json) {
    return SliderImage(
      cta: json[kCta],
      image: json[kImage],
      sort_order: json[kSortOrder],
      title: json[kTitle],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[kCta] = cta;
    data[kImage] = image;
    data[kSortOrder] = sort_order;
    data[kTitle] = title;
    return data;
  }
}
