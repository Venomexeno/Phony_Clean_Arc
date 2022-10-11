import 'package:equatable/equatable.dart';

class BrandDevices extends Equatable {
  final String deviceName;
  final String slug;
  final String image;

  const BrandDevices({
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
