import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/home/domain/entities/brands.dart';
import 'package:dartz/dartz.dart';

abstract class BaseBrandsRepository {
  Future<Either<Failure,List<Brands>>> getBrands();
}
