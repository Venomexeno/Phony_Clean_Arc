import 'package:clean_arc_phony/core/error/exceptions.dart';
import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/home/data/datasource/search_result_data_source.dart';
import 'package:clean_arc_phony/home/domain/entities/search_result.dart';
import 'package:clean_arc_phony/home/domain/repository/base_search_result.dart';
import 'package:clean_arc_phony/home/domain/usecase/get_search_result_usecase.dart';
import 'package:dartz/dartz.dart';

class SearchResultRepository extends BaseSearchResultRepository {
  final BaseSearchResultDataSource baseSearchResultDataSource;

  SearchResultRepository(this.baseSearchResultDataSource);

  @override
  Future<Either<Failure, List<SearchResult>>> getSearchResult(
      SearchResultParameter parameters) async {
    final result = await baseSearchResultDataSource.getSearchResult(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.errorMessage));
    }
  }
}
