import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/core/ussecase/base_usecase.dart';
import 'package:clean_arc_phony/device_spec/domain/enitities/device_spec.dart';
import 'package:clean_arc_phony/device_spec/domain/repository/base_device_spec_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetDeviceSpecUseCase
    extends BaseUseCase<DeviceSpec, DeviceSpecParameters> {
  final BaseDeviceSpecRepository baseDeviceSpecRepository;

  GetDeviceSpecUseCase(this.baseDeviceSpecRepository);

  @override
  Future<Either<Failure, DeviceSpec>> call(
      DeviceSpecParameters parameters) async {
    return await baseDeviceSpecRepository.getDeviceSpec(parameters);
  }
}

class DeviceSpecParameters extends Equatable {
  final String slug;

  const DeviceSpecParameters({required this.slug});

  @override
  List<Object> get props => [slug];
}
