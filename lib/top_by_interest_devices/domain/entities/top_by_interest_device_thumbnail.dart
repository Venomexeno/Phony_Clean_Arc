import 'package:equatable/equatable.dart';

class TopByInterestDeviceThumbnail extends Equatable {
  final String thumbnail;

  const TopByInterestDeviceThumbnail({
    required this.thumbnail,
  });

  @override
  List<Object> get props => [thumbnail];
}
