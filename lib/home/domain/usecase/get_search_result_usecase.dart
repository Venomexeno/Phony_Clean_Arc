import 'package:clean_arc_phony/core/error/failure.dart';
import 'package:clean_arc_phony/core/ussecase/base_usecase.dart';
import 'package:clean_arc_phony/home/domain/entities/search_result.dart';
import 'package:clean_arc_phony/home/domain/repository/base_search_result.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetSearchResultUseCase
    extends BaseUseCase<List<SearchResult>, SearchResultParameter> {
  final BaseSearchResultRepository baseSearchResultRepository;

  GetSearchResultUseCase(this.baseSearchResultRepository);

  @override
  Future<Either<Failure, List<SearchResult>>> call(
      SearchResultParameter parameters) async {
    return await baseSearchResultRepository.getSearchResult(parameters);
  }
}

class SearchResultParameter extends Equatable {
  final String query;

  const SearchResultParameter(this.query);

  @override
  List<Object> get props => [query];
}
