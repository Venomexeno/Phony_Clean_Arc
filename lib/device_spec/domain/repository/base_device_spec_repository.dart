import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/device_spec/domain/enitities/device_spec.dart';
import 'package:clean_arc_phony/device_spec/domain/usecase/get_device_spec_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class BaseDeviceSpecRepository {
  Future<Either<Failure, DeviceSpec>> getDeviceSpec(
      DeviceSpecParameters parameters);
}
