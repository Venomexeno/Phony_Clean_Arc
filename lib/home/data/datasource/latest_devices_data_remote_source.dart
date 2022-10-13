import 'package:clean_arc_phony/home/data/models/latest_devices_model.dart';
import 'package:clean_arc_phony/core/error/exceptions.dart';
import 'package:clean_arc_phony/core/network/api_constance.dart';
import 'package:clean_arc_phony/core/network/error_message_model.dart';
import 'package:dio/dio.dart';

abstract class BaseLatestDevicesRemoteDataSource {
  Future<List<LatestDevicesModel>> getLatestDevices();
}

class LatestDevicesRemoteDataSource extends BaseLatestDevicesRemoteDataSource {
  @override
  Future<List<LatestDevicesModel>> getLatestDevices() async {
    final response = await Dio().get(ApiConstance.latestDevicesPath);

    if (response.statusCode == 200) {
      return List<LatestDevicesModel>.from(
          (response.data["data"]["phones"] as List).map(
        (e) => LatestDevicesModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
