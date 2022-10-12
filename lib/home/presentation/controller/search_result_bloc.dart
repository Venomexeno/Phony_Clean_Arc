import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_arc_phony/core/utils/enums.dart';
import 'package:clean_arc_phony/home/domain/entities/search_result.dart';
import 'package:clean_arc_phony/home/domain/usecase/get_search_result_usecase.dart';
import 'package:equatable/equatable.dart';

part 'search_result_event.dart';

part 'search_result_state.dart';

class SearchResultBloc extends Bloc<SearchResultEvent, SearchResultState> {
  final GetSearchResultUseCase getBaseSearchResultUseCase;

  SearchResultBloc(this.getBaseSearchResultUseCase)
      : super(SearchResultState()) {
    on<GetSearchResultEvent>(_getSearchResult);
  }

  FutureOr<void> _getSearchResult(
      GetSearchResultEvent event, Emitter<SearchResultState> emit) async {
    final result =
        await getBaseSearchResultUseCase(SearchResultParameter(event.query));

    result.fold(
      (l) => emit(
        state.copyWith(
          requestState: RequestState.error,
          errorMessage: l.errorMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          requestState: RequestState.loaded,
          searchResult: r,
        ),
      ),
    );
  }
}
