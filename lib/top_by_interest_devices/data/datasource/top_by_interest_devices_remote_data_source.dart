import 'package:clean_arc_phony/core/error/exceptions.dart';
import 'package:clean_arc_phony/core/network/api_constance.dart';
import 'package:clean_arc_phony/core/network/error_message_model.dart';
import 'package:clean_arc_phony/top_by_interest_devices/data/models/top_by_interest_devices_model.dart';
import 'package:clean_arc_phony/top_by_interest_devices/data/models/top_by_interest_device_thumbnail_model.dart';
import 'package:clean_arc_phony/top_by_interest_devices/domain/usecase/get_top_by_interest_device_thumbnail_usecase.dart';
import 'package:dio/dio.dart';

abstract class BaseTopByInterestDevicesRemoteDataSource {
  Future<List<TopByInterestDevicesModel>> getTopByInterestDevices();

  Future<TopByInterestDeviceThumbnailModel> getTopByInterestDeviceThumbnail(
      TopByInterestDeviceThumbnailParameter parameters);
}

class TopByInterestDevicesRemoteDataSource
    extends BaseTopByInterestDevicesRemoteDataSource {
  @override
  Future<List<TopByInterestDevicesModel>> getTopByInterestDevices() async {
    final response = await Dio().get(ApiConstance.topByInterestDevicesPath);

    if (response.statusCode == 200) {
      return List<TopByInterestDevicesModel>.from(
        (response.data["data"]["phones"] as List)
            .map((e) => TopByInterestDevicesModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<TopByInterestDeviceThumbnailModel> getTopByInterestDeviceThumbnail(
      TopByInterestDeviceThumbnailParameter parameters) async {
    final response =
    await Dio().get(ApiConstance.deviceThumbnailPath(parameters.slug));
    if (response.statusCode == 200) {
      return TopByInterestDeviceThumbnailModel.fromJson(response.data["data"]);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
