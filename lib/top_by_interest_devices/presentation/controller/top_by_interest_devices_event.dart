part of 'top_by_interest_devices_bloc.dart';

abstract class TopByInterestDevicesEvent extends Equatable {
  const TopByInterestDevicesEvent();

  @override
  List<Object> get props => [];
}

class GetTopByInterestDevicesEvent extends TopByInterestDevicesEvent {}
