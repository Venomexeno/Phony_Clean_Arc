import 'package:equatable/equatable.dart';

class TopByFansDevices extends Equatable {
  final String deviceName;
  final String slug;
  final int favorites;
  final String detail;

  const TopByFansDevices({
    required this.deviceName,
    required this.slug,
    required this.favorites,
    required this.detail,
  });

  @override
  List<Object> get props => [
    deviceName,
        slug,
        favorites,
        detail,
      ];
}
