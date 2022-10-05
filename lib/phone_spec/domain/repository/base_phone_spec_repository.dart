import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/phone_spec/domain/enitities/phone_spec.dart';
import 'package:dartz/dartz.dart';

abstract class BasePhoneSpecRepository {
  Future<Either<Failure,PhoneSpec>> getPhoneSpec();
}
