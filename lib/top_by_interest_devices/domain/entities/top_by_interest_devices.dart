import 'package:equatable/equatable.dart';

class TopByInterestDevices extends Equatable {
  final String phoneName;
  final String slug;
  final int hits;
  final String detail;

  const TopByInterestDevices({
    required this.phoneName,
    required this.slug,
    required this.hits,
    required this.detail,
  });

  @override
  List<Object> get props => [
        phoneName,
        slug,
        hits,
        detail,
      ];
}
