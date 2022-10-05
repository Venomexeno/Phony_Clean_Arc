import 'package:equatable/equatable.dart';

class TopByFansDevices extends Equatable {
  final String phoneName;
  final String slug;
  final int favorites;
  final String detail;

  const TopByFansDevices({
    required this.phoneName,
    required this.slug,
    required this.favorites,
    required this.detail,
  });

  @override
  List<Object> get props => [
        phoneName,
        slug,
        favorites,
        detail,
      ];
}
