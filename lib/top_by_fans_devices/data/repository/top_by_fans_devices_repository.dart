import 'package:clean_arc_phony/core/error/exceptions.dart';
import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/top_by_fans_devices/data/datasource/top_by_fans_devices_remote_data_source.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/entities/top_by_fans_phone_thumbnail.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/entities/top_by_fans_devices.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/repository/base_top_by_fans_devices_repository.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/usecase/top_by_fans_phone_thumbnail_usecase.dart';
import 'package:dartz/dartz.dart';

class TopByFansDevicesRepository extends BaseTopByFansDevicesRepository {
  final BaseTopByFansDevicesRemoteDataSource
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
  Future<Either<Failure, TopByFansPhoneThumbnail>> getTopByFansPhoneThumbnail(
      TopByFansPhoneThumbnailParameter parameters) async {
    final result = await baseTopByFansDevicesRemoteDataSource
        .getTopByFansPhoneThumbnail(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.errorMessage));
    }
  }
}
