
import 'package:clean_arc_phony/top_by_fans_devices/domain/entities/top_by_fans_device_thumbnail.dart';

class TopByFansDeviceThumbnailModel extends TopByFansDeviceThumbnail {
  const TopByFansDeviceThumbnailModel({
    required super.thumbnail,
  });

  factory TopByFansDeviceThumbnailModel.fromJson(Map<String, dynamic> json) =>
      TopByFansDeviceThumbnailModel(
        thumbnail: json["thumbnail"],
      );
}
