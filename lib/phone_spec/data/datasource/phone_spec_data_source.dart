import 'package:clean_arc_phony/core/error/exceptions.dart';
import 'package:clean_arc_phony/core/network/api_constance.dart';
import 'package:clean_arc_phony/core/network/error_message_model.dart';
import 'package:clean_arc_phony/phone_spec/data/models/phone_spec_model.dart';
import 'package:dio/dio.dart';

abstract class BasePhoneSpecDataSource {
  Future<PhoneSpecModel> getPhoneSpec();
}

class PhoneSpecDataSource extends BasePhoneSpecDataSource {
  @override
  Future<PhoneSpecModel> getPhoneSpec() async {
    final response = await Dio().get(ApiConstance.phoneSpec);
    if (response.statusCode == 200) {
      return PhoneSpecModel.fromJson(response.data["data"]);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
