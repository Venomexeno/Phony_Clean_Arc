import 'package:clean_arc_phony/core/error/exceptions.dart';
import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/top_by_fans_devices/data/datasource/top_by_fans_devices_data_source.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/entities/top_by_fans_device_thumbnail.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/entities/top_by_fans_devices.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/repository/base_top_by_fans_devices_repository.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/usecase/get_top_by_fans_device_thumbnail_usecase.dart';
import 'package:dartz/dartz.dart';

class TopByFansDevicesRepository extends BaseTopByFansDevicesRepository {
  final BaseTopByFansDevicesDataSource
      baseTopByFansDevicesRemoteDataSource;

  TopByFansDevicesRepository(this.baseTopByFansDevicesRemoteDataSource);

  @override
  Future<Either<Failure, List<TopByFansDevices>>> getTopByFansDevices() async {
    final result =
        await baseTopByFansDevicesRemoteDataSource.getTopByFansDevices();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, TopByFansDeviceThumbnail>> getTopByFansDeviceThumbnail(
      TopByFansDeviceThumbnailParameter parameters) async {
    final result = await baseTopByFansDevicesRemoteDataSource
        .getTopByFansDeviceThumbnail(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.errorMessage));
    }
  }
}
