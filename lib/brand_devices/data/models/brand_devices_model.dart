import 'package:clean_arc_phony/brand_devices/domain/entities/brand_devices.dart';

class BrandDevicesModel extends BrandDevices {
  const BrandDevicesModel({
    required super.deviceName,
    required super.slug,
    required super.image,
  });

  factory BrandDevicesModel.fromJson(Map<String, dynamic> json) =>
      BrandDevicesModel(
        deviceName: json["phone_name"],
        slug: json["slug"],
        image: json["image"],
      );
}
