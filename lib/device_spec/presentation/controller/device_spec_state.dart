part of 'device_spec_bloc.dart';

class DeviceSpecState extends Equatable {
  final DeviceSpec? deviceSpec;
  final RequestState requestState;
  final String errorMessage;
  final PageController controller = PageController(initialPage: 0);
  int currentPage = 0;
  late Timer timer;

  DeviceSpecState({
    this.deviceSpec,
    this.requestState = RequestState.loading,
    this.errorMessage = '',
  });

  DeviceSpecState copyWith({
    DeviceSpec? deviceSpec,
    RequestState? requestState,
    String? errorMessage,
  }) {
    return DeviceSpecState(
      deviceSpec: deviceSpec ?? this.deviceSpec,
      requestState: requestState ?? this.requestState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        deviceSpec,
        requestState,
        errorMessage,
      ];
}
