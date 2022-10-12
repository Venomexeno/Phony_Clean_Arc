part of 'device_spec_bloc.dart';

abstract class DeviceSpecEvent extends Equatable {
  const DeviceSpecEvent();

  @override
  List<Object> get props => [];
}

class GetDeviceSpecEvent extends DeviceSpecEvent {
  final String slug;

  const GetDeviceSpecEvent(this.slug);

  @override
  List<Object> get props => [
        slug,
      ];
}
