import 'package:clean_arc_phony/phone_spec/data/models/Specifications_model.dart';
import 'package:clean_arc_phony/phone_spec/domain/enitities/phone_spec.dart';
import 'package:clean_arc_phony/phone_spec/domain/enitities/specifications.dart';

class PhoneSpecModel extends PhoneSpec {
  const PhoneSpecModel({
    required super.phoneName,
    required super.thumbnail,
    required super.phoneImages,
    required super.specifications,
  });

  factory PhoneSpecModel.fromJson(Map<String, dynamic> json) => PhoneSpecModel(
        phoneName: json["phone_name"],
        thumbnail: json["thumbnail"],
        phoneImages:
            List<String>.from(json["phone_images"].map((photos) => photos)),
        specifications: List<Specifications>.from(
          json["specifications"].map((e) => SpecificationsModel.fromJson(e)),
        ),
      );
}
