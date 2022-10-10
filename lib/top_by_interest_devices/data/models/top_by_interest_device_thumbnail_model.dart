import 'package:clean_arc_phony/top_by_interest_devices/domain/entities/top_by_interest_device_thumbnail.dart';

class TopByInterestDeviceThumbnailModel extends TopByInterestDeviceThumbnail {
  const TopByInterestDeviceThumbnailModel({
    required super.thumbnail,
  });

  factory TopByInterestDeviceThumbnailModel.fromJson(
          Map<String, dynamic> json) =>
      TopByInterestDeviceThumbnailModel(
        thumbnail: json["thumbnail"],
      );
}
