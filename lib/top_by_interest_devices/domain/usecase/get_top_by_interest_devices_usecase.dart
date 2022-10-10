import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/core/ussecase/base_usecase.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/entities/top_by_interest_devices.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/repository/base_top_by_interest_devices_repository.dart';
import 'package:dartz/dartz.dart';

class GetTopByInterestDevicesUseCase
    extends BaseUseCase<List<TopByInterestDevices>, NoParameters> {
  final BaseTopByInterestDevicesRepository baseTopByInterestDevicesRepository;

  GetTopByInterestDevicesUseCase(this.baseTopByInterestDevicesRepository);

  @override
  Future<Either<Failure, List<TopByInterestDevices>>> call(
      NoParameters parameters) async {
    return await baseTopByInterestDevicesRepository.getTopByInterestDevices();
  }
}
