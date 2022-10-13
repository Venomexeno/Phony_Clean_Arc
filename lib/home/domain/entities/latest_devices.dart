import 'package:equatable/equatable.dart';

class LatestDevices extends Equatable {
  final String deviceName;
  final String slug;
  final String image;
  final String detail;

  const LatestDevices({
    required this.deviceName,
    required this.slug,
    required this.image,
    required this.detail,
  });

  @override
  List<Object> get props => [
    deviceName,
        slug,
        image,
        detail,
      ];
}
