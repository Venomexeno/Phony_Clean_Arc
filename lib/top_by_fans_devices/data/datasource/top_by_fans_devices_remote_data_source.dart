import 'package:clean_arc_phony/core/error/exceptions.dart';
import 'package:clean_arc_phony/core/network/api_constance.dart';
import 'package:clean_arc_phony/core/network/error_message_model.dart';
import 'package:clean_arc_phony/top_by_fans_devices/data/models/top_by_fans_devices_model.dart';
import 'package:dio/dio.dart';

abstract class BaseTopByFansDevicesRemoteDataSource {
  Future<List<TopByFansDevicesModel>> getTopByFansDevices();
}

class TopByFansDevicesRemoteDataSource extends BaseTopByFansDevicesRemoteDataSource {
  @override
  Future<List<TopByFansDevicesModel>> getTopByFansDevices() async {
    final response = await Dio().get(ApiConstance.topByFansDevicesPath);

    if (response.statusCode == 200) {
      return List<TopByFansDevicesModel>.from(
          (response.data["phones"] as List).map(
        (e) => TopByFansDevicesModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
