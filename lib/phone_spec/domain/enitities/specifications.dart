import 'package:clean_arc_phony/phone_spec/domain/enitities/specs.dart';
import 'package:equatable/equatable.dart';

class Specifications extends Equatable {
  final String title;
  final List<Specs> specs;

  const Specifications({
    required this.title,
    required this.specs,
  });

  @override
  List<Object> get props => [
        title,
        specs,
      ];
}
