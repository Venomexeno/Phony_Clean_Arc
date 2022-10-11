part of 'brand_devices_bloc.dart';

abstract class BrandDevicesEvent extends Equatable {
  const BrandDevicesEvent();

  @override
  List<Object> get props => [];
}

class GetBrandDevicesEvent extends BrandDevicesEvent {
  final String brandSlug;

  const GetBrandDevicesEvent(this.brandSlug);

  @override
  List<Object> get props => [brandSlug];
}
