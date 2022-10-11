import 'package:clean_arc_phony/brand_devices/domain/entities/brand_devices.dart';
import 'package:clean_arc_phony/brand_devices/domain/usecase/get_brand_devices_usecase.dart';
import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseBrandDevicesRepository {
  Future<Either<Failure, List<BrandDevices>>> getBrandDevices(
      BrandDevicesParameter parameters);
}
