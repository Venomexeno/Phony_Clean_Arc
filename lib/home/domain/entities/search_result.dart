import 'package:equatable/equatable.dart';

class SearchResult extends Equatable {
  final String brand;
  final String deviceName;
  final String slug;
  final String image;

  const SearchResult({
    required this.brand,
    required this.deviceName,
    required this.slug,
    required this.image,
  });

  @override
  List<Object> get props => [
        brand,
        deviceName,
        slug,
        image,
      ];
}
