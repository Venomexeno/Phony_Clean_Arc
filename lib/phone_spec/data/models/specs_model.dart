import 'package:clean_arc_phony/phone_spec/domain/enitities/specs.dart';

class SpecsModel extends Specs {
  const SpecsModel({
    required super.key,
    required super.val,
  });

  factory SpecsModel.fromJson(Map<String, dynamic> json) => SpecsModel(
        key: json["key"],
        val: List<String>.from(json["val"].map((e) => e)),
      );
}
