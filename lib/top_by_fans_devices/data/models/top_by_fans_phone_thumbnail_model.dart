
import 'package:clean_arc_phony/top_by_fans_devices/domain/entities/top_by_fans_phone_thumbnail.dart';

class TopByFansPhoneThumbnailModel extends TopByFansPhoneThumbnail {
  const TopByFansPhoneThumbnailModel({
    required super.thumbnail,
  });

  factory TopByFansPhoneThumbnailModel.fromJson(Map<String, dynamic> json) =>
      TopByFansPhoneThumbnailModel(
        thumbnail: json["thumbnail"],
      );
}
