import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/entities/top_by_fans_devices.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/repository/base_top_by_fans_devices_repository.dart';
import 'package:dartz/dartz.dart';

class TopByFansDevicesUseCase{

  final BaseTopByFansDevicesRepository baseTopByFansDevicesRepository;

  TopByFansDevicesUseCase(this.baseTopByFansDevicesRepository);

  Future<Either<Failure, List<TopByFansDevices>>> execute() async{
    return await baseTopByFansDevicesRepository.getTopByFansDevices();
  }
}