import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/core/ussecase/base_usecase.dart';
import 'package:clean_arc_phony/home/domain/entities/brands.dart';
import 'package:clean_arc_phony/home/domain/repository/base_brands_repository.dart';
import 'package:dartz/dartz.dart';

class GetBrandsUseCase extends BaseUseCase<List<Brands>, NoParameters> {
  final BaseBrandsRepository baseBrandsRepository;

  GetBrandsUseCase(this.baseBrandsRepository);

  @override
  Future<Either<Failure, List<Brands>>> call(NoParameters parameters) async {
    return await baseBrandsRepository.getBrands();
  }
}
