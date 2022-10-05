import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/phone_spec/domain/enitities/phone_spec.dart';
import 'package:clean_arc_phony/phone_spec/domain/repository/base_phone_spec_repository.dart';
import 'package:dartz/dartz.dart';

class PhoneSpecUseCase{
  final BasePhoneSpecRepository basePhoneSpecRepository;

  PhoneSpecUseCase(this.basePhoneSpecRepository);

  Future<Either<Failure,PhoneSpec>> execute() async {
    return await basePhoneSpecRepository.getPhoneSpec();
  }
}