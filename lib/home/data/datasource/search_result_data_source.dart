import 'package:clean_arc_phony/core/error/exceptions.dart';
import 'package:clean_arc_phony/core/network/api_constance.dart';
import 'package:clean_arc_phony/core/network/error_message_model.dart';
import 'package:clean_arc_phony/home/data/models/search_result_model.dart';
import 'package:clean_arc_phony/home/domain/usecase/get_search_result_usecase.dart';
import 'package:dio/dio.dart';

abstract class BaseSearchResultDataSource {
  Future<List<SearchResultModel>> getSearchResult(
      SearchResultParameter parameters);
}

class SearchResultDataSource extends BaseSearchResultDataSource {
  @override
  Future<List<SearchResultModel>> getSearchResult(
      SearchResultParameter parameters) async {
    final response =
        await Dio().get(ApiConstance.searchResultPath(parameters.query));

    if (response.statusCode == 200) {
      return List<SearchResultModel>.from(
        (response.data["data"]["phones"] as List).map(
          (e) => SearchResultModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
