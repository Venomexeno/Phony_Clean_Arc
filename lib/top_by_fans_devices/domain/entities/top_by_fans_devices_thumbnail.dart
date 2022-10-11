import 'package:equatable/equatable.dart';

class TopByFansDevicesThumbnail extends Equatable {
  final String thumbnail;

  const TopByFansDevicesThumbnail({
    required this.thumbnail,
  });

  @override
  List<Object> get props => [thumbnail];
}
