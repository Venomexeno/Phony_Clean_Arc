import 'package:clean_arc_phony/top_by_fans_devices/domain/entities/top_by_fans_devices.dart';

class TopByFansDevicesModel extends TopByFansDevices {
  const TopByFansDevicesModel({
    required super.deviceName,
    required super.slug,
    required super.favorites,
    required super.detail,
  });

  factory TopByFansDevicesModel.fromJson(Map<String, dynamic> json) =>
      TopByFansDevicesModel(
        deviceName: json["phone_name"],
        slug: json["slug"],
        favorites: json["favorites"],
        detail: json["detail"],
      );
}
