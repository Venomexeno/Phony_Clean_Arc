import 'package:equatable/equatable.dart';

class Specs extends Equatable {
  final String key;
  final List<String> val;

  const Specs({
    required this.key,
    required this.val,
  });

  @override
  List<Object> get props => [
        key,
        val,
      ];
}
