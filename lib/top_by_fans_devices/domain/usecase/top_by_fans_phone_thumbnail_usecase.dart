import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/core/ussecase/base_usecase.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/entities/top_by_fans_phone_thumbnail.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/repository/base_top_by_fans_devices_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class TopByFansPhoneThumbnailUseCase
    extends BaseUseCase<TopByFansPhoneThumbnail, TopByFansPhoneThumbnailParameter> {
  final BaseTopByFansDevicesRepository baseTopByFansDevicesRepository;

  TopByFansPhoneThumbnailUseCase(this.baseTopByFansDevicesRepository);

  @override
  Future<Either<Failure, TopByFansPhoneThumbnail>> call(
      TopByFansPhoneThumbnailParameter parameters) async {
    return await baseTopByFansDevicesRepository.getTopByFansPhoneThumbnail(parameters);
  }
}

class TopByFansPhoneThumbnailParameter extends Equatable {
  final String slug;

  const TopByFansPhoneThumbnailParameter({required this.slug});

  @override
  List<Object> get props => [slug];
}
