import 'package:clean_arc_phony/top_by_interest_devices/domain/entities/top_by_interest_devices.dart';

class TopByInterestDevicesModel extends TopByInterestDevices {
  const TopByInterestDevicesModel({
    required super.phoneName,
    required super.slug,
    required super.hits,
    required super.detail,
  });

  factory TopByInterestDevicesModel.fromJson(Map<String, dynamic> json) =>
      TopByInterestDevicesModel(
        phoneName: json["phone_name"],
        slug: json["slug"],
        hits: json["hits"],
        detail: json["detail"],
      );
}
