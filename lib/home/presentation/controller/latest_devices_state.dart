part of 'latest_devices_bloc.dart';

class LatestDevicesState extends Equatable {
  final List<LatestDevices> latestDevices;
  final RequestState requestState;
  final String errorMessage;

  const LatestDevicesState({
    this.latestDevices = const [],
    this.requestState = RequestState.loading,
    this.errorMessage = '',
  });

  LatestDevicesState copyWith({
    List<LatestDevices>? latestDevices,
    RequestState? requestState,
    String? errorMessage,
  }) {
    return LatestDevicesState(
      latestDevices: latestDevices ?? this.latestDevices,
      requestState: requestState ?? this.requestState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        latestDevices,
        requestState,
        errorMessage,
      ];
}
