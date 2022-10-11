import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_arc_phony/core/ussecase/base_usecase.dart';
import 'package:clean_arc_phony/core/utils/enums.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/entities/top_by_fans_devices.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/entities/top_by_fans_devices_thumbnail.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/usecase/get_top_by_fans_devices_thumbnail_usecase.dart';
import 'package:clean_arc_phony/top_by_fans_devices/domain/usecase/get_top_by_fans_devices_usecase.dart';
import 'package:equatable/equatable.dart';

part 'top_by_fans_devices_event.dart';

part 'top_by_fans_devices_state.dart';

class TopByFansDevicesBloc
    extends Bloc<TopByFansDevicesEvent, TopByFansDevicesState> {
  final GetTopByFansDevicesUseCase getTopByFansDevicesUseCase;
  final GetTopByFansDevicesThumbnailUseCase getTopByFansDevicesThumbnailUseCase;

  TopByFansDevicesBloc(
    this.getTopByFansDevicesUseCase,
    this.getTopByFansDevicesThumbnailUseCase,
  ) : super(const TopByFansDevicesState()) {
    on<GetTopByFansDevicesEvent>(_getTopByFansDevices);
    on<GetTopByFansDevicesThumbnailEvent>(_getTopByFansDevicesThumbnail);
  }

  FutureOr<void> _getTopByFansDevices(GetTopByFansDevicesEvent event,
      Emitter<TopByFansDevicesState> emit) async {
    final result = await getTopByFansDevicesUseCase(const NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          topByFansRequestState: RequestState.error,
          topByFansErrorMessage: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topByFansDevicesThumbnailRequestState: RequestState.loaded,
          topByFansDevices: r,
        ),
      ),
    );
  }

  FutureOr<void> _getTopByFansDevicesThumbnail(
      GetTopByFansDevicesThumbnailEvent event,
      Emitter<TopByFansDevicesState> emit) async {
    final result = await getTopByFansDevicesThumbnailUseCase(
        TopByFansDeviceThumbnailParameter(slug: event.slug));
  }
}
