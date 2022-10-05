import 'package:clean_arc_phony/phone_spec/domain/enitities/phone_spec.dart';

class PhoneSpecModel extends PhoneSpec {
  const PhoneSpecModel({
    required super.phoneName,
    required super.thumbnail,
    required super.phoneImages,
    required super.specifications,
  });

  factory PhoneSpecModel.fromJson(Map<String, dynamic> json) {
    var list = json['specifications'] as List;
    List<Specifications> specificationsList = list
        .map((specifications) => SpecificationsModel.fromJson(specifications))
        .toList();
    return PhoneSpecModel(
      phoneName: json["phone_name"],
      thumbnail: json["thumbnail"],
      phoneImages:
          List<String>.from(json["phone_images"].map((photos) => photos)),
      specifications: specificationsList,
    );
  }
}

class SpecificationsModel extends Specifications {
  const SpecificationsModel({
    required super.title,
    required super.specs,
  });

  factory SpecificationsModel.fromJson(Map<String, dynamic> json) {
    var list = json["specs"] as List;
    List<Specs> specsList =
        list.map((specs) => SpecsModel.fromJson(specs)).toList();
    return SpecificationsModel(
      title: json["title"],
      specs: specsList,
    );
  }
}

class SpecsModel extends Specs {
  const SpecsModel({
    required super.key,
    required super.val,
  });

  factory SpecsModel.fromJson(Map<String, dynamic> json) {
    return SpecsModel(
      key: json["key"],
      val: json["val"],
    );
  }
}
