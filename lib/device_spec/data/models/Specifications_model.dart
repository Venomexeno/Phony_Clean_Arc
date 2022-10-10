import 'package:clean_arc_phony/device_spec/data/models/specs_model.dart';
import 'package:clean_arc_phony/device_spec/domain/enitities/specifications.dart';
import 'package:clean_arc_phony/device_spec/domain/enitities/specs.dart';

class SpecificationsModel extends Specifications {
  const SpecificationsModel({
    required super.title,
    required super.specs,
  });

  factory SpecificationsModel.fromJson(Map<String, dynamic> json) =>
      SpecificationsModel(
        title: json["title"],
        specs: List<Specs>.from(
          json["specs"].map((e) => SpecsModel.fromJson(e)),
        ),
      );
}
