import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_arc_phony/core/utils/enums.dart';
import 'package:clean_arc_phony/device_spec/domain/enitities/device_spec.dart';
import 'package:clean_arc_phony/device_spec/domain/usecase/get_device_spec_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'device_spec_event.dart';

part 'device_spec_state.dart';

class DeviceSpecBloc extends Bloc<DeviceSpecEvent, DeviceSpecState> {
  final GetDeviceSpecUseCase getDeviceSpecUseCase;

  DeviceSpecBloc(this.getDeviceSpecUseCase) : super(DeviceSpecState()) {
    on<GetDeviceSpecEvent>(_getDeviceSpec);
  }

  FutureOr<void> _getDeviceSpec(
      GetDeviceSpecEvent event, Emitter<DeviceSpecState> emit) async {
    final result =
        await getDeviceSpecUseCase(DeviceSpecParameters(slug: event.slug));

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
          deviceSpec: r,
        ),
      ),
    );
  }
}
