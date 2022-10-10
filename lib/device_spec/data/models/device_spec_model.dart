import 'package:clean_arc_phony/device_spec/data/models/Specifications_model.dart';
import 'package:clean_arc_phony/device_spec/domain/enitities/device_spec.dart';
import 'package:clean_arc_phony/device_spec/domain/enitities/specifications.dart';

class DeviceSpecModel extends DeviceSpec {
  const DeviceSpecModel({
    required super.deviceName,
    required super.thumbnail,
    required super.deviceImages,
    required super.specifications,
  });

  factory DeviceSpecModel.fromJson(Map<String, dynamic> json) =>
      DeviceSpecModel(
        deviceName: json["phone_name"],
        thumbnail: json["thumbnail"],
        deviceImages:
            List<String>.from(json["phone_images"].map((photos) => photos)),
        specifications: List<Specifications>.from(
          json["specifications"].map((e) => SpecificationsModel.fromJson(e)),
        ),
      );
}
