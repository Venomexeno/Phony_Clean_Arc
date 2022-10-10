import 'package:clean_arc_phony/device_spec/domain/enitities/specifications.dart';
import 'package:equatable/equatable.dart';

class DeviceSpec extends Equatable {
  final String deviceName;
  final String thumbnail;
  final List<String> deviceImages;
  final List<Specifications> specifications;

  const DeviceSpec({
    required this.deviceName,
    required this.thumbnail,
    required this.deviceImages,
    required this.specifications,
  });

  @override
  List<Object> get props => [
        deviceName,
        thumbnail,
        deviceImages,
        specifications,
      ];
}
