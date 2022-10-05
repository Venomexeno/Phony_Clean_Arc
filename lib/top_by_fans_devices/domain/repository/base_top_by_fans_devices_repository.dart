import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/entities/top_by_fans_devices.dart';
import 'package:dartz/dartz.dart';

abstract class BaseTopByFansDevicesRepository {
  Future<Either<Failure, List<TopByFansDevices>>> getTopByFansDevices();
}
