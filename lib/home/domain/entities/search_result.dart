import 'package:equatable/equatable.dart';

class SearchResult extends Equatable {
  final String deviceName;
  final String slug;
  final String image;

  SearchResult({
    required this.deviceName,
    required this.slug,
    required this.image,
  });

  @override
  List<Object> get props => [
        deviceName,
        slug,
        image,
      ];
}
