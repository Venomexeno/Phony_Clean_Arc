import 'package:equatable/equatable.dart';

class PhoneSpec extends Equatable {
  final String phoneName;
  final String thumbnail;
  final List<String> phoneImages;
  final List<Specifications> specifications;

  const PhoneSpec({
    required this.phoneName,
    required this.thumbnail,
    required this.phoneImages,
    required this.specifications,
  });

  @override
  List<Object> get props => [
        phoneName,
        thumbnail,
        phoneImages,
        specifications,
      ];
}

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
