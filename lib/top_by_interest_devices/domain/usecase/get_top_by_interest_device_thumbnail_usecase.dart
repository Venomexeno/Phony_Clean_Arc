import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/core/ussecase/base_usecase.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/entities/top_by_interest_device_thumbnail.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/repository/base_top_by_interest_devices_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetTopByInterestDeviceThumbnailUseCase extends BaseUseCase<
    TopByInterestDeviceThumbnail, TopByInterestDeviceThumbnailParameter> {
  final BaseTopByInterestDevicesRepository baseTopByInterestDevicesRepository;

  GetTopByInterestDeviceThumbnailUseCase(
      this.baseTopByInterestDevicesRepository);

  @override
  Future<Either<Failure, TopByInterestDeviceThumbnail>> call(
      TopByInterestDeviceThumbnailParameter parameters) async {
    return await baseTopByInterestDevicesRepository
        .getTopByInterestDeviceThumbnail(parameters);
  }
}

class TopByInterestDeviceThumbnailParameter extends Equatable {
  final String slug;

  const TopByInterestDeviceThumbnailParameter({required this.slug});

  @override
  List<Object> get props => [slug];
}
