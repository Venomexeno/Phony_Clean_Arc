import 'package:equatable/equatable.dart';

class Brands extends Equatable {
  final int brandId;
  final String brandName;
  final String brandSlug;

  Brands({
    required this.brandId,
    required this.brandName,
    required this.brandSlug,
  });

  @override
  List<Object> get props => [
        brandId,
        brandName,
        brandSlug,
      ];
}
