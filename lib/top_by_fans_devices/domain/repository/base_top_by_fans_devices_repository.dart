import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/entities/top_by_fans_device_thumbnail.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/entities/top_by_fans_devices.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/usecase/get_top_by_fans_device_thumbnail_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class BaseTopByFansDevicesRepository {
  Future<Either<Failure, List<TopByFansDevices>>> getTopByFansDevices();

  Future<Either<Failure, TopByFansDeviceThumbnail>> getTopByFansDeviceThumbnail(
      TopByFansDeviceThumbnailParameter parameters);
}
