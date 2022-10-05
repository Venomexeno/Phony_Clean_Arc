import 'package:clean_arc_phony/Latest_devices/domain/repository/base_latest_devices_repository.dart';
import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/latest_devices.dart';

class LatestDevicesUseCase {
  final BaseLatestDevicesRepository baseLatestDevicesRepository;

  LatestDevicesUseCase(this.baseLatestDevicesRepository);

  Future<Either<Failure, List<LatestDevices>>> execute() async {
    return await baseLatestDevicesRepository.getLatestDevices();
  }
}
