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
  }

  FutureOr<void> _getTopByFansDevices(GetTopByFansDevicesEvent event,
      Emitter<TopByFansDevicesState> emit) async {
    final deviceResult = await getTopByFansDevicesUseCase(const NoParameters());
    List<String> thumbnail = [];

    deviceResult.fold(
      (l) => emit(
        state.copyWith(
          topByFansDevicesRequestState: RequestState.error,
          topByFansDevicesErrorMessage: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topByFansDevicesRequestState: RequestState.loaded,
          topByFansDevices: r,
        ),
      ),
    );
    for (int index = 0; index < state.topByFansDevices.length; index++) {
      final thumbnailResult = await getTopByFansDevicesThumbnailUseCase(
          TopByFansDeviceThumbnailParameter(
              slug: state.topByFansDevices[index].slug));

      thumbnailResult.fold(
        (l) => emit(
          state.copyWith(
              topByFansDevicesThumbnailRequestState: RequestState.error,
              topByFansDeviceThumbnailErrorMessage: l.errorMessage),
        ),
        (r) => thumbnail.add(r.thumbnail),
      );
    }
    emit(
      state.copyWith(
        topByFansDevicesThumbnailRequestState: RequestState.loaded,
        thumbnail: thumbnail,
      ),
    );
  }
}
