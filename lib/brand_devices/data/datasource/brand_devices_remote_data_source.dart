import 'package:clean_arc_phony/brand_devices/data/models/brand_devices_model.dart';
import 'package:clean_arc_phony/brand_devices/domain/usecase/get_brand_devices_usecase.dart';
import 'package:clean_arc_phony/core/error/exceptions.dart';
import 'package:clean_arc_phony/core/network/api_constance.dart';
import 'package:clean_arc_phony/core/network/error_message_model.dart';
import 'package:dio/dio.dart';

abstract class BaseBrandDevicesRemoteDataSource {
  Future<List<BrandDevicesModel>> getBrandDevices(
      BrandDevicesParameter parameters);
}

class BrandDevicesRemoteDataSource extends BaseBrandDevicesRemoteDataSource {
  @override
  Future<List<BrandDevicesModel>> getBrandDevices(
      BrandDevicesParameter parameters) async {
    final response =
        await Dio().get(ApiConstance.brandDevicesPath(parameters.brandSlug));
    if (response.statusCode == 200) {
      return List<BrandDevicesModel>.from(
        (response.data["data"]["phones"] as List).map(
          (e) => BrandDevicesModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
