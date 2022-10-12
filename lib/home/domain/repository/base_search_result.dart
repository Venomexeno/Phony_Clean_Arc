import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/home/domain/entities/search_result.dart';
import 'package:clean_arc_phony/home/domain/usecase/get_search_result_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class BaseSearchResultRepository {
  Future<Either<Failure, List<SearchResult>>> getSearchResult(
      SearchResultParameter parameters);
}
