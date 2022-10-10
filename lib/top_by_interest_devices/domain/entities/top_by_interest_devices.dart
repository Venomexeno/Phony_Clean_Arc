import 'package:equatable/equatable.dart';

class TopByInterestDevices extends Equatable {
  final String deviceName;
  final String slug;
  final int hits;
  final String detail;

  const TopByInterestDevices({
    required this.deviceName,
    required this.slug,
    required this.hits,
    required this.detail,
  });

  @override
  List<Object> get props => [
    deviceName,
        slug,
        hits,
        detail,
      ];
}
