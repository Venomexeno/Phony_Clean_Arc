import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/entities/top_by_interest_devices.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/entities/top_by_interest_phone_thumbnail.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/usecase/top_by_interest_phone_thumbnail_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class BaseTopByInterestDevicesRepository {
  Future<Either<Failure, List<TopByInterestDevices>>> getTopByInterestDevices();

  Future<Either<Failure, TopByInterestPhoneThumbnail>>
      getTopByInterestPhoneThumbnail(
          TopByInterestPhoneThumbnailParameter parameters);
}
