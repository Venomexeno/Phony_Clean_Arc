import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/core/ussecase/base_usecase.dart';
import 'package:clean_arc_phony/phone_spec/domain/enitities/phone_spec.dart';
import 'package:clean_arc_phony/phone_spec/domain/repository/base_phone_spec_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class PhoneSpecUseCase extends BaseUseCase<PhoneSpec, PhoneSpecParameters> {
  final BasePhoneSpecRepository basePhoneSpecRepository;

  PhoneSpecUseCase(this.basePhoneSpecRepository);

  @override
  Future<Either<Failure, PhoneSpec>> call(
      PhoneSpecParameters parameters) async {
    return await basePhoneSpecRepository.getPhoneSpec(parameters);
  }
}

class PhoneSpecParameters extends Equatable {
  final String slug;

  const PhoneSpecParameters({required this.slug});

  @override
  List<Object> get props => [slug];
}
