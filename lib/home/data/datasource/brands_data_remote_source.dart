import 'package:clean_arc_phony/core/error/exceptions.dart';
import 'package:clean_arc_phony/core/network/api_constance.dart';
import 'package:clean_arc_phony/core/network/error_message_model.dart';
import 'package:clean_arc_phony/home/data/models/brands_model.dart';
import 'package:dio/dio.dart';

abstract class BaseBrandsRemoteDataSource {
  Future<List<BrandsModel>> getBrands();
}

class BrandsRemoteDataSource extends BaseBrandsRemoteDataSource {
  @override
  Future<List<BrandsModel>> getBrands() async {
    final response = await Dio().get(ApiConstance.brandsPath);
    if (response.statusCode == 200) {
      return List<BrandsModel>.from(
        (response.data["data"] as List).map(
          (e) => BrandsModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
