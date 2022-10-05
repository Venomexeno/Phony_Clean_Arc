import 'package:clean_arc_phony/Latest_devices/data/datasource/latest_devices_remote_data_source.dart';
import 'package:clean_arc_phony/Latest_devices/domain/entities/latest_devices.dart';
import 'package:clean_arc_phony/Latest_devices/domain/repository/base_latest_devices_repository.dart';
import 'package:clean_arc_phony/core/error/exceptions.dart';
import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class LatestDevicesRepository extends BaseLatestDevicesRepository {
  final BaseLatestDevicesRemoteDataSource baseLatestDevicesRemoteDataSource;

  LatestDevicesRepository(this.baseLatestDevicesRemoteDataSource);

  @override
  Future<Either<Failure, List<LatestDevices>>> getLatestDevices() async {
    final result = await baseLatestDevicesRemoteDataSource.getLatestDevices();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.errorMessage));
    }
  }
}
