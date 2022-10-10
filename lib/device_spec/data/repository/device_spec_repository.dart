import 'package:clean_arc_phony/core/error/exceptions.dart';
import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/device_spec/data/datasource/device_spec_data_source.dart';
import 'package:clean_arc_phony/device_spec/domain/enitities/device_spec.dart';
import 'package:clean_arc_phony/device_spec/domain/repository/base_device_spec_repository.dart';
import 'package:clean_arc_phony/device_spec/domain/usecase/get_device_spec_usecase.dart';
import 'package:dartz/dartz.dart';

class DeviceSpecRepository extends BaseDeviceSpecRepository {
  final BaseDeviceSpecRemoteDataSource baseDeviceSpecDataSource;

  DeviceSpecRepository(this.baseDeviceSpecDataSource);

  @override
  Future<Either<Failure, DeviceSpec>> getDeviceSpec(
      DeviceSpecParameters parameters) async {
    final result = await baseDeviceSpecDataSource.getDeviceSpec(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.errorMessage));
    }
  }
}
