import 'package:clean_arc_phony/top_by_interest_devices/domain/entities/top_by_interest_phone_thumbnail.dart';

class TopByInterestPhoneThumbnailModel extends TopByInterestPhoneThumbnail {
  const TopByInterestPhoneThumbnailModel({
    required super.thumbnail,
  });

  factory TopByInterestPhoneThumbnailModel.fromJson(
          Map<String, dynamic> json) =>
      TopByInterestPhoneThumbnailModel(
        thumbnail: json["thumbnail"],
      );
}
