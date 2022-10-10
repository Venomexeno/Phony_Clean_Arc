import 'package:clean_arc_phony/phone_spec/domain/enitities/specifications.dart';
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
