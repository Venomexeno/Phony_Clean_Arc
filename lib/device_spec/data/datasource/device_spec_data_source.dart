import 'package:clean_arc_phony/core/error/exceptions.dart';
import 'package:clean_arc_phony/core/network/api_constance.dart';
import 'package:clean_arc_phony/core/network/error_message_model.dart';
import 'package:clean_arc_phony/device_spec/data/models/device_spec_model.dart';
import 'package:clean_arc_phony/device_spec/domain/usecase/get_device_spec_usecase.dart';
import 'package:dio/dio.dart';

abstract class BaseDeviceSpecRemoteDataSource {
  Future<DeviceSpecModel> getDeviceSpec(DeviceSpecParameters parameters);

}

class DeviceRemoteDataSource extends BaseDeviceSpecRemoteDataSource {
  @override
  Future<DeviceSpecModel> getDeviceSpec(DeviceSpecParameters parameters) async {
    final response = await Dio().get(ApiConstance.deviceSpecPath(parameters));
    if (response.statusCode == 200) {
      return DeviceSpecModel.fromJson(response.data["data"]);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

}
