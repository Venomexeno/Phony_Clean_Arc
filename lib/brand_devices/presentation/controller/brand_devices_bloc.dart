import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_arc_phony/brand_devices/domain/entities/brand_devices.dart';
import 'package:clean_arc_phony/brand_devices/domain/usecase/get_brand_devices_usecase.dart';
import 'package:clean_arc_phony/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'brand_devices_event.dart';

part 'brand_devices_state.dart';

class BrandDevicesBloc extends Bloc<BrandDevicesEvent, BrandDevicesState> {
  final GetBrandDevicesUseCase getBrandDevicesUseCase;

  BrandDevicesBloc(this.getBrandDevicesUseCase)
      : super(const BrandDevicesState()) {
    on<GetBrandDevicesEvent>(_getBrandDevices);
  }

  FutureOr<void> _getBrandDevices(
      GetBrandDevicesEvent event, Emitter<BrandDevicesState> emit) async {
    final result = await getBrandDevicesUseCase(
        BrandDevicesParameter(brandSlug: event.brandSlug));

    result.fold(
      (l) => emit(
        state.copyWith(
          requestState: RequestState.error,
          errorMessage: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          requestState: RequestState.loaded,
          brandDevices: r,
        ),
      ),
    );
  }
}
