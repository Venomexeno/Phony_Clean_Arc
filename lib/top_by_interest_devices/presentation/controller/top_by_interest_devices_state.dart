part of 'top_by_interest_devices_bloc.dart';

class TopByInterestDevicesState extends Equatable {
  final List<TopByInterestDevices> topByInterestDevices;
  final RequestState topByInterestDevicesRequestState;
  final String topByInterestDevicesErrorMessage;

  final TopByInterestDeviceThumbnail? topByInterestDeviceThumbnail;
  final List<String> thumbnail;
  final RequestState topByInterestDeviceThumbnailRequestState;
  final String topByInterestDeviceThumbnailErrorMessage;

  const TopByInterestDevicesState({
    this.topByInterestDevices = const [],
    this.topByInterestDevicesRequestState = RequestState.loading,
    this.topByInterestDevicesErrorMessage = '',
    this.topByInterestDeviceThumbnail,
    this.thumbnail = const [],
    this.topByInterestDeviceThumbnailRequestState = RequestState.loading,
    this.topByInterestDeviceThumbnailErrorMessage = '',
  });

  TopByInterestDevicesState copyWith({
    List<TopByInterestDevices>? topByInterestDevices,
    RequestState? topByInterestDevicesRequestState,
    String? topByInterestDevicesErrorMessage,
    TopByInterestDeviceThumbnail? topByInterestDeviceThumbnail,
    List<String>? thumbnail,
    RequestState? topByInterestDeviceThumbnailRequestState,
    String? topByInterestDeviceThumbnailErrorMessage,
  }) {
    return TopByInterestDevicesState(
      topByInterestDevices: topByInterestDevices ?? this.topByInterestDevices,
      topByInterestDevicesRequestState: topByInterestDevicesRequestState ??
          this.topByInterestDevicesRequestState,
      topByInterestDevicesErrorMessage: topByInterestDevicesErrorMessage ??
          this.topByInterestDevicesErrorMessage,
      topByInterestDeviceThumbnail:
          topByInterestDeviceThumbnail ?? this.topByInterestDeviceThumbnail,
      thumbnail: thumbnail ?? this.thumbnail,
      topByInterestDeviceThumbnailRequestState:
          topByInterestDeviceThumbnailRequestState ??
              this.topByInterestDeviceThumbnailRequestState,
      topByInterestDeviceThumbnailErrorMessage:
          topByInterestDeviceThumbnailErrorMessage ??
              this.topByInterestDeviceThumbnailErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        topByInterestDevices,
        topByInterestDevicesRequestState,
        topByInterestDevicesErrorMessage,
        topByInterestDeviceThumbnail,
        thumbnail,
        topByInterestDeviceThumbnailRequestState,
        topByInterestDeviceThumbnailErrorMessage,
      ];
}
