import 'package:clean_arc_phony/brand_devices/data/datasource/brand_devices_data_source.dart';
import 'package:clean_arc_phony/brand_devices/domain/entities/brand_devices.dart';
import 'package:clean_arc_phony/brand_devices/domain/repository/base_brand_devices_repository.dart';
import 'package:clean_arc_phony/brand_devices/domain/usecase/get_brand_devices_usecase.dart';
import 'package:clean_arc_phony/core/error/exceptions.dart';
import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class BrandDevicesRepository extends BaseBrandDevicesRepository {
  final BaseBrandDevicesDataSource baseBrandDevicesDataSource;

  BrandDevicesRepository(this.baseBrandDevicesDataSource);

  @override
  Future<Either<Failure, List<BrandDevices>>> getBrandDevices(
      BrandDevicesParameter parameters) async {
    final result = await baseBrandDevicesDataSource.getBrandDevices(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.errorMessage));
    }
  }
}
