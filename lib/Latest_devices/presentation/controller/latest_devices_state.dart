part of 'latest_devices_bloc.dart';

class LatestDevicesState extends Equatable {
  final List<LatestDevices> latestDevices;
  final RequestState requestState;
  final String latestDevicesMessage;

  const LatestDevicesState({
    this.latestDevices = const [],
    this.requestState = RequestState.loading,
    this.latestDevicesMessage = '',
  });

  LatestDevicesState copyWith({
    List<LatestDevices>? latestDevices,
    RequestState? requestState,
    String? latestDevicesMessage,
  }) {
    return LatestDevicesState(
      latestDevices: latestDevices ?? this.latestDevices,
      requestState: requestState ?? this.requestState,
      latestDevicesMessage: latestDevicesMessage ?? this.latestDevicesMessage,
    );
  }

  @override
  List<Object> get props => [
        latestDevices,
        requestState,
        latestDevicesMessage,
      ];
}
