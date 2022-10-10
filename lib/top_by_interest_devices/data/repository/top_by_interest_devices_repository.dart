import 'package:clean_arc_phony/core/error/exceptions.dart';
import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/top_by_interest_devices/data/datasource/top_by_interest_devices_data_source.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/entities/top_by_interest_devices.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/entities/top_by_interest_phone_thumbnail.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/repository/base_top_by_interest_devices_repository.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/usecase/top_by_interest_phone_thumbnail_usecase.dart';
import 'package:dartz/dartz.dart';

class TopByInterestDevicesRepository
    extends BaseTopByInterestDevicesRepository {
  final BaseTopByInterestDevicesDataSource baseTopByInterestDevicesDataSource;

  TopByInterestDevicesRepository(this.baseTopByInterestDevicesDataSource);

  @override
  Future<Either<Failure, List<TopByInterestDevices>>>
      getTopByInterestDevices() async {
    final result =
        await baseTopByInterestDevicesDataSource.getTopByInterestDevices();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, TopByInterestPhoneThumbnail>> getTopByInterestPhoneThumbnail(TopByInterestPhoneThumbnailParameter parameters) async {
    final result = await baseTopByInterestDevicesDataSource
        .getTopByInterestPhoneThumbnail(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.errorMessage));
    }
  }

}
