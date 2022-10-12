part of 'search_result_bloc.dart';

class SearchResultState extends Equatable {
  final List<SearchResult> searchResult;
  RequestState requestState;
  final String errorMessage;

  SearchResultState({
    this.searchResult = const [],
    this.requestState = RequestState.loading,
    this.errorMessage = '',
  });

  SearchResultState copyWith({
    List<SearchResult>? searchResult,
    RequestState? requestState,
    String? errorMessage,
  }) {
    return SearchResultState(
      searchResult: searchResult ?? this.searchResult,
      requestState: requestState ?? this.requestState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        searchResult,
        requestState,
        errorMessage,
      ];
}
