import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_arc_phony/core/ussecase/base_usecase.dart';
import 'package:clean_arc_phony/core/utils/enums.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/entities/top_by_interest_device_thumbnail.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/entities/top_by_interest_devices.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/usecase/get_top_by_interest_device_thumbnail_usecase.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/usecase/get_top_by_interest_devices_usecase.dart';
import 'package:equatable/equatable.dart';

part 'top_by_interest_devices_event.dart';

part 'top_by_interest_devices_state.dart';

class TopByInterestDevicesBloc
    extends Bloc<TopByInterestDevicesEvent, TopByInterestDevicesState> {
  final GetTopByInterestDevicesUseCase getTopByInterestDevicesUseCase;
  final GetTopByInterestDeviceThumbnailUseCase
      getTopByInterestDeviceThumbnailUseCase;

  TopByInterestDevicesBloc(
    this.getTopByInterestDevicesUseCase,
    this.getTopByInterestDeviceThumbnailUseCase,
  ) : super(const TopByInterestDevicesState()) {
    on<TopByInterestDevicesEvent>(_getTopByInterestDevices);
  }

  FutureOr<void> _getTopByInterestDevices(TopByInterestDevicesEvent event,
      Emitter<TopByInterestDevicesState> emit) async {
    final deviceResult =
        await getTopByInterestDevicesUseCase(const NoParameters());
    List<String> thumbnail = [];
    deviceResult.fold(
      (l) => emit(
        state.copyWith(
          topByInterestDevicesRequestState: RequestState.error,
          topByInterestDevicesErrorMessage: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topByInterestDevicesRequestState: RequestState.loaded,
          topByInterestDevices: r,
        ),
      ),
    );
    for (int index = 0; index < state.topByInterestDevices.length; index++) {
      final thumbnailResult = await getTopByInterestDeviceThumbnailUseCase(
          TopByInterestDeviceThumbnailParameter(
              slug: state.topByInterestDevices[index].slug));

      thumbnailResult.fold(
        (l) => emit(
          state.copyWith(
              topByInterestDeviceThumbnailRequestState: RequestState.error,
              topByInterestDeviceThumbnailErrorMessage: l.errorMessage),
        ),
        (r) => thumbnail.add(r.thumbnail),
      );
    }
    emit(
      state.copyWith(
        topByInterestDeviceThumbnailRequestState: RequestState.loaded,
        thumbnail: thumbnail,
      ),
    );
  }
}
