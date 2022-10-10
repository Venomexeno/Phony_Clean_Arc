import 'package:equatable/equatable.dart';

class TopByInterestPhoneThumbnail extends Equatable {
  final String thumbnail;

  const TopByInterestPhoneThumbnail({
    required this.thumbnail,
  });

  @override
  List<Object> get props => [thumbnail];
}
