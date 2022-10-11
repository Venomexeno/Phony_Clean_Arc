import 'package:clean_arc_phony/core/error/exceptions.dart';
import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/home/data/datasource/brands_data_source.dart';
import 'package:clean_arc_phony/home/domain/entities/brands.dart';
import 'package:clean_arc_phony/home/domain/repository/base_brands_repository.dart';
import 'package:dartz/dartz.dart';

class BrandsRepository extends BaseBrandsRepository {
  final BaseBrandsDataSource baseBrandsDataSource;

  BrandsRepository(this.baseBrandsDataSource);

  @override
  Future<Either<Failure, List<Brands>>> getBrands() async {
    final result = await baseBrandsDataSource.getBrands();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.errorMessage));
    }
  }
}
