import 'package:clean_arc_phony/home/domain/entities/search_result.dart';

class SearchResultModel extends SearchResult {
  SearchResultModel({
    required super.deviceName,
    required super.slug,
    required super.image,
  });

  factory SearchResultModel.fromJson(Map<String, dynamic> json) =>
      SearchResultModel(
        deviceName: json["phone_name"],
        slug: json["slug"],
        image: json["image"],
      );
}
