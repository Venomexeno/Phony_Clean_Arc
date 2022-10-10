import 'package:clean_arc_phony/core/error/exceptions.dart';
import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/phone_spec/data/datasource/phone_spec_data_source.dart';
import 'package:clean_arc_phony/phone_spec/domain/enitities/phone_spec.dart';
import 'package:clean_arc_phony/phone_spec/domain/repository/base_phone_spec_repository.dart';
import 'package:clean_arc_phony/phone_spec/domain/usecase/phone_spec_usecase.dart';
import 'package:dartz/dartz.dart';

class PhoneSpecRepository extends BasePhoneSpecRepository {
  final BasePhoneSpecRemoteDataSource basePhoneSpecDataSource;

  PhoneSpecRepository(this.basePhoneSpecDataSource);

  @override
  Future<Either<Failure, PhoneSpec>> getPhoneSpec(
      PhoneSpecParameters parameters) async {
    final result = await basePhoneSpecDataSource.getPhoneSpec(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.errorMessage));
    }
  }


}
