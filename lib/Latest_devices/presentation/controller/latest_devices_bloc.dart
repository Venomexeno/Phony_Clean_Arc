import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_arc_phony/Latest_devices/domain/entities/latest_devices.dart';
import 'package:clean_arc_phony/Latest_devices/domain/usecase/get_latest_devices_usecase.dart';
import 'package:clean_arc_phony/core/ussecase/base_usecase.dart';
import 'package:clean_arc_phony/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'latest_devices_event.dart';

part 'latest_devices_state.dart';

class LatestDevicesBloc extends Bloc<LatestDevicesEvent, LatestDevicesState> {
  final GetLatestDevicesUseCase getLatestDevicesUseCase;

  LatestDevicesBloc(this.getLatestDevicesUseCase) : super(const LatestDevicesState()) {
    on<GetLatestDevicesEvent>(_getLatestDevices);
  }

  FutureOr<void> _getLatestDevices(
      GetLatestDevicesEvent event, Emitter<LatestDevicesState> emit) async {
    final result = await getLatestDevicesUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          requestState: RequestState.error,
          latestDevicesMessage: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          requestState: RequestState.loaded,
          latestDevices: r,
        ),
      ),
    );
  }
}
