import 'package:clean_arc_phony/home/domain/entities/brands.dart';

class BrandsModel extends Brands {
  BrandsModel({
    required super.brandId,
    required super.brandName,
    required super.brandSlug,
  });

  factory BrandsModel.fromJson(Map<String, dynamic> json) => BrandsModel(
        brandId: json["brand_id"],
        brandName: json["brand_name"],
        brandSlug: json["brand_slug"],
      );
}
