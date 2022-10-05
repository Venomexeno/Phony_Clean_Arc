import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final bool status;
  final String errorMessage;

  const ErrorMessageModel({
    required this.status,
    required this.errorMessage,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        status: json["status"],
        errorMessage: json["error"],
      );

  @override
  List<Object> get props => [status, errorMessage];
}
