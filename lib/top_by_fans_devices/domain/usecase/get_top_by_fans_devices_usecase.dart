import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/core/ussecase/base_usecase.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/entities/top_by_fans_devices.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/repository/base_top_by_fans_devices_repository.dart';
import 'package:dartz/dartz.dart';

class GetTopByFansDevicesUseCase
    extends BaseUseCase<List<TopByFansDevices>, NoParameters> {
  final BaseTopByFansDevicesRepository baseTopByFansDevicesRepository;

  GetTopByFansDevicesUseCase(this.baseTopByFansDevicesRepository);

  @override
  Future<Either<Failure, List<TopByFansDevices>>> call(
      NoParameters parameters) async {
    return await baseTopByFansDevicesRepository.getTopByFansDevices();
  }
}
