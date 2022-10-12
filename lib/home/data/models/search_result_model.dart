import 'package:clean_arc_phony/home/domain/entities/search_result.dart';

class SearchResultModel extends SearchResult {
  const SearchResultModel({
    required super.brand,
    required super.deviceName,
    required super.slug,
    required super.image,
  });

  factory SearchResultModel.fromJson(Map<String, dynamic> json) =>
      SearchResultModel(
        brand: json["brand"],
        deviceName: json["phone_name"],
        slug: json["slug"],
        image: json["image"],
      );
}
