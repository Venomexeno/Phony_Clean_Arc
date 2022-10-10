import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/core/ussecase/base_usecase.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/entities/top_by_interest_phone_thumbnail.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/repository/base_top_by_interest_devices_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class TopByInterestPhoneThumbnailUseCase extends BaseUseCase<
    TopByInterestPhoneThumbnail, TopByInterestPhoneThumbnailParameter> {
  final BaseTopByInterestDevicesRepository baseTopByInterestDevicesRepository;

  TopByInterestPhoneThumbnailUseCase(this.baseTopByInterestDevicesRepository);

  @override
  Future<Either<Failure, TopByInterestPhoneThumbnail>> call(
      TopByInterestPhoneThumbnailParameter parameters) async {
    return await baseTopByInterestDevicesRepository
        .getTopByInterestPhoneThumbnail(parameters);
  }
}

class TopByInterestPhoneThumbnailParameter extends Equatable {
  final String slug;

  const TopByInterestPhoneThumbnailParameter({required this.slug});

  @override
  List<Object> get props => [slug];
}
