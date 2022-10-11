part of 'top_by_fans_devices_bloc.dart';

class TopByFansDevicesState extends Equatable {
  final List<TopByFansDevices> topByFansDevices;
  final RequestState topByFansRequestState;
  final String topByFansErrorMessage;

  final List<TopByFansDevicesThumbnail> topByFansDevicesThumbnail;
  final RequestState topByFansDevicesThumbnailRequestState;
  final String topByFansDevicesThumbnailErrorMessage;

  const TopByFansDevicesState({
    this.topByFansDevices = const [],
    this.topByFansRequestState = RequestState.loading,
    this.topByFansErrorMessage = '',
    this.topByFansDevicesThumbnail = const [],
    this.topByFansDevicesThumbnailRequestState = RequestState.loading,
    this.topByFansDevicesThumbnailErrorMessage = '',
  });

  TopByFansDevicesState copyWith({
    List<TopByFansDevices>? topByFansDevices,
    RequestState? topByFansRequestState,
    String? topByFansErrorMessage,
    List<TopByFansDevicesThumbnail>? topByFansDevicesThumbnail,
    RequestState? topByFansDevicesThumbnailRequestState,
    String? topByFansDevicesThumbnailErrorMessage,
  }) {
    return TopByFansDevicesState(
      topByFansDevices: topByFansDevices ?? this.topByFansDevices,
      topByFansRequestState:
          topByFansRequestState ?? this.topByFansRequestState,
      topByFansErrorMessage:
          topByFansErrorMessage ?? this.topByFansErrorMessage,
      topByFansDevicesThumbnail:
          topByFansDevicesThumbnail ?? this.topByFansDevicesThumbnail,
      topByFansDevicesThumbnailRequestState:
          topByFansDevicesThumbnailRequestState ??
              this.topByFansDevicesThumbnailRequestState,
      topByFansDevicesThumbnailErrorMessage:
          topByFansDevicesThumbnailErrorMessage ??
              this.topByFansDevicesThumbnailErrorMessage,
    );
  }

  @override
  List<Object> get props => [
        topByFansDevices,
        topByFansRequestState,
        topByFansErrorMessage,
        topByFansDevicesThumbnail,
        topByFansDevicesThumbnailRequestState,
        topByFansDevicesThumbnailErrorMessage,
      ];
}
