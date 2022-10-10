import 'package:equatable/equatable.dart';

class TopByFansDeviceThumbnail extends Equatable {
  final String thumbnail;

  const TopByFansDeviceThumbnail({
    required this.thumbnail,
  });

  @override
  List<Object> get props => [thumbnail];
}
