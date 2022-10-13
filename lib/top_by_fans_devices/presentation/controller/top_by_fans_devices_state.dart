part of 'top_by_fans_devices_bloc.dart';

class TopByFansDevicesState extends Equatable {
  final List<TopByFansDevices> topByFansDevices;
  final RequestState topByFansDevicesRequestState;
  final String topByFansDevicesErrorMessage;

  final TopByFansDeviceThumbnail? topByFansDeviceThumbnail;
  final List<String> thumbnail;
  final RequestState topByFansDeviceThumbnailRequestState;
  final String topByFansDeviceThumbnailErrorMessage;

  const TopByFansDevicesState({
    this.topByFansDevices = const [],
    this.topByFansDevicesRequestState = RequestState.loading,
    this.topByFansDevicesErrorMessage = '',
    this.topByFansDeviceThumbnail,
    this.thumbnail = const [],
    this.topByFansDeviceThumbnailRequestState = RequestState.loading,
    this.topByFansDeviceThumbnailErrorMessage = '',
  });

  TopByFansDevicesState copyWith({
    List<TopByFansDevices>? topByFansDevices,
    RequestState? topByFansDevicesRequestState,
    String? topByFansDevicesErrorMessage,
    TopByFansDeviceThumbnail? topByFansDeviceThumbnail,
    List<String>? thumbnail,
    RequestState? topByFansDeviceThumbnailRequestState,
    String? topByFansDeviceThumbnailErrorMessage,
  }) {
    return TopByFansDevicesState(
      topByFansDevices: topByFansDevices ?? this.topByFansDevices,
      topByFansDevicesRequestState:
          topByFansDevicesRequestState ?? this.topByFansDevicesRequestState,
      topByFansDevicesErrorMessage:
          topByFansDevicesErrorMessage ?? this.topByFansDevicesErrorMessage,
      topByFansDeviceThumbnail:
          topByFansDeviceThumbnail ?? this.topByFansDeviceThumbnail,
      thumbnail: thumbnail ?? this.thumbnail,
      topByFansDeviceThumbnailRequestState:
          topByFansDeviceThumbnailRequestState ??
              this.topByFansDeviceThumbnailRequestState,
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
        topByFansDeviceThumbnail,
        topByFansDeviceThumbnailRequestState,
        topByFansDeviceThumbnailErrorMessage,
      ];
}
