part of 'latest_devices_bloc.dart';

abstract class LatestDevicesEvent extends Equatable {
  const LatestDevicesEvent();

  @override
  List<Object> get props => [];
}

class GetLatestDevicesEvent extends LatestDevicesEvent {}
