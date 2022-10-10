import 'package:equatable/equatable.dart';

class TopByFansPhoneThumbnail extends Equatable {
  final String thumbnail;

  const TopByFansPhoneThumbnail({
    required this.thumbnail,
  });

  @override
  List<Object> get props => [thumbnail];
}
