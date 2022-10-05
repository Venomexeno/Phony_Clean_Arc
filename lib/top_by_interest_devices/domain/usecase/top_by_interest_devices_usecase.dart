import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/entities/top_by_interest_devices.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/repository/base_top_by_interest_devices_repository.dart';
import 'package:dartz/dartz.dart';

class TopByInterestDevicesUseCase {
  final BaseTopByInterestDevicesRepository baseTopByInterestDevicesRepository;

  TopByInterestDevicesUseCase(this.baseTopByInterestDevicesRepository);

  Future<Either<Failure, List<TopByInterestDevices>>> execute() async {
    return await baseTopByInterestDevicesRepository.getTopByInterestDevices();
  }
}
