import 'package:equatable/equatable.dart';

class LatestDevices extends Equatable {
  final String phoneName;
  final String slug;
  final String image;
  final String detail;

  const LatestDevices({
    required this.phoneName,
    required this.slug,
    required this.image,
    required this.detail,
  });

  @override
  List<Object> get props => [
        phoneName,
        slug,
        image,
        detail,
      ];
}
