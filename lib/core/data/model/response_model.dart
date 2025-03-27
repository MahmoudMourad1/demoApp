
import 'package:user/config/routes/app_routes.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'package:equatable/equatable.dart';

class ResponseModel extends Equatable {
  final Map<String, dynamic>? data;
  final String? message;
  final String? status;
  final bool? success;
  final String? access_token;

  const ResponseModel({
    this.data,
    this.status,
    this.message,
    this.success,
    this.access_token
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {

    return ResponseModel(
        data: json,
        success:  json["isSuccess"],
        status:json["status"],
        message: RouterApp.currentContext?.languageCode=='ar'?json["message_ar"]:json["message_en"],
        access_token:json["access_token"]
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [data, message,access_token, success,status];
}
class ResponseModel2 extends Equatable {
  final List<dynamic>? data;
  final String? message;
  final String? status;
  final bool? success;
  final String? access_token;

  const ResponseModel2({
    this.data,
    this.status,
    this.message,
    this.success,
    this.access_token
  });

  factory ResponseModel2.fromJson(List<dynamic> json) {

    return ResponseModel2(
        data: json,
        // success:  json["isSuccess"],
        // status:json["status"],
        // message: RouterApp.currentContext?.languageCode=='ar'?json["message_ar"]:json["message_en"],
        // access_token:json["access_token"]
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [data, message,access_token, success,status];
}
