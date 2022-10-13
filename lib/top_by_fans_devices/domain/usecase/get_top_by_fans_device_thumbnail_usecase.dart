import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/core/ussecase/base_usecase.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/entities/top_by_fans_device_thumbnail.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/repository/base_top_by_fans_devices_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetTopByFansDeviceThumbnailUseCase extends BaseUseCase<
    TopByFansDeviceThumbnail, TopByFansDeviceThumbnailParameter> {
  final BaseTopByFansDevicesRepository baseTopByFansDevicesRepository;

  GetTopByFansDeviceThumbnailUseCase(this.baseTopByFansDevicesRepository);

  @override
  Future<Either<Failure, TopByFansDeviceThumbnail>> call(
      TopByFansDeviceThumbnailParameter parameters) async {
    return await baseTopByFansDevicesRepository
        .getTopByFansDeviceThumbnail(parameters);
  }
}

class TopByFansDeviceThumbnailParameter extends Equatable {
  final String slug;

  const TopByFansDeviceThumbnailParameter({required this.slug});

  @override
  List<Object> get props => [slug];
}
