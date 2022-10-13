part of 'top_by_fans_devices_bloc.dart';

abstract class TopByFansDevicesEvent extends Equatable {
  const TopByFansDevicesEvent();

  @override
  List<Object> get props => [];
}

class GetTopByFansDevicesEvent extends TopByFansDevicesEvent {}
