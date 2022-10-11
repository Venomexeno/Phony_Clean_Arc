part of 'brand_devices_bloc.dart';

class BrandDevicesState extends Equatable {
  final List<BrandDevices> brandDevices;
  final RequestState requestState;
  final String errorMessage;

  const BrandDevicesState({
    this.brandDevices = const [],
    this.requestState = RequestState.loading,
    this.errorMessage = '',
  });

  BrandDevicesState copyWith({
    List<BrandDevices>? brandDevices,
    RequestState? requestState,
    String? errorMessage,
  }) {
    return BrandDevicesState(
      brandDevices: brandDevices ?? this.brandDevices,
      requestState: requestState ?? this.requestState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        brandDevices,
        requestState,
        errorMessage,
      ];
}
