import 'package:clean_arc_phony/home/data/datasource/latest_devices_data_remote_source.dart';
import 'package:clean_arc_phony/home/domain/entities/latest_devices.dart';
import 'package:clean_arc_phony/home/domain/repository/base_latest_devices_repository.dart';
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
