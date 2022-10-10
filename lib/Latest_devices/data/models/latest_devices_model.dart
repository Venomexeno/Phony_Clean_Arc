import 'package:clean_arc_phony/Latest_devices/domain/entities/latest_devices.dart';

class LatestDevicesModel extends LatestDevices {
  const LatestDevicesModel({
    required super.phoneName,
    required super.slug,
    required super.image,
    required super.detail,
  });

  factory LatestDevicesModel.fromJson(Map<String, dynamic> json) =>
      LatestDevicesModel(
        phoneName: json["phone_name"]!,
        slug: json["slug"]!,
        image: json["image"]!,
        detail: json["detail"]!,
      );
}
