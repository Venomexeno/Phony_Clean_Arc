import 'package:clean_arc_phony/brand_devices/domain/entities/brand_devices.dart';
import 'package:clean_arc_phony/brand_devices/domain/repository/base_brand_devices_repository.dart';
import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/core/ussecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetBrandDevicesUseCase
    extends BaseUseCase<List<BrandDevices>, BrandDevicesParameter> {
  final BaseBrandDevicesRepository baseBrandDevicesRepository;

  GetBrandDevicesUseCase(this.baseBrandDevicesRepository);

  @override
  Future<Either<Failure, List<BrandDevices>>> call(
      BrandDevicesParameter parameters) async {
    return await baseBrandDevicesRepository.getBrandDevices(parameters);
  }
}

class BrandDevicesParameter extends Equatable {
  final String brandSlug;

  const BrandDevicesParameter({
    required this.brandSlug,
  });

  @override
  List<Object> get props => [
        brandSlug,
      ];
}
