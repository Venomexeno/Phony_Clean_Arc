part of 'search_result_bloc.dart';

abstract class SearchResultEvent extends Equatable {
  const SearchResultEvent();

  @override
  List<Object> get props => [];
}

class GetSearchResultEvent extends SearchResultEvent {
  final String query;

  const GetSearchResultEvent(this.query);

  @override
  List<Object> get props => [query];
}
