part of 'top_by_fans_devices_bloc.dart';

class TopByFansDevicesState extends Equatable {
  final List<TopByFansDevices> topByFansDevices;
  final RequestState topByFansDevicesRequestState;
  final String topByFansDevicesErrorMessage;

  final TopByFansDevicesThumbnail? topByFansDevicesThumbnail;
  final List<String> thumbnail;
  final RequestState topByFansDevicesThumbnailRequestState;
  final String topByFansDeviceThumbnailErrorMessage;

  const TopByFansDevicesState({
    this.topByFansDevices = const [],
    this.topByFansDevicesRequestState = RequestState.loading,
    this.topByFansDevicesErrorMessage = '',
    this.topByFansDevicesThumbnail,
    this.thumbnail = const [],
    this.topByFansDevicesThumbnailRequestState = RequestState.loading,
    this.topByFansDeviceThumbnailErrorMessage = '',
  });

  TopByFansDevicesState copyWith({
    List<TopByFansDevices>? topByFansDevices,
    RequestState? topByFansDevicesRequestState,
    String? topByFansDevicesErrorMessage,
    TopByFansDevicesThumbnail? topByFansDevicesThumbnail,
    List<String>? thumbnail,
    RequestState? topByFansDevicesThumbnailRequestState,
    String? topByFansDeviceThumbnailErrorMessage,
  }) {
    return TopByFansDevicesState(
      topByFansDevices: topByFansDevices ?? this.topByFansDevices,
      topByFansDevicesRequestState:
          topByFansDevicesRequestState ?? this.topByFansDevicesRequestState,
      topByFansDevicesErrorMessage:
          topByFansDevicesErrorMessage ?? this.topByFansDevicesErrorMessage,
      topByFansDevicesThumbnail:
          topByFansDevicesThumbnail ?? this.topByFansDevicesThumbnail,
      thumbnail: thumbnail ?? this.thumbnail,
      topByFansDevicesThumbnailRequestState:
          topByFansDevicesThumbnailRequestState ??
              this.topByFansDevicesThumbnailRequestState,
      topByFansDeviceThumbnailErrorMessage:
          topByFansDeviceThumbnailErrorMessage ??
              this.topByFansDeviceThumbnailErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        topByFansDevices,
        topByFansDevicesRequestState,
        topByFansDevicesErrorMessage,
        topByFansDevicesThumbnail,
        topByFansDevicesThumbnailRequestState,
        topByFansDeviceThumbnailErrorMessage,
      ];
}
