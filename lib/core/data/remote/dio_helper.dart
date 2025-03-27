import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:user/config/routes/app_routes.dart';
import 'package:user/core/data/exceptions/exception.dart';
import 'package:user/core/data/model/response_model.dart';
import 'package:user/core/widgets/components/snackbar_item.dart';
import 'package:user/service_locator.dart';
import 'package:user/utils/api_utils/api_constants.dart';
import 'package:user/utils/cache_utils/cach_vars.dart';
import 'package:user/utils/cache_utils/pref_keys.dart';
import 'package:user/utils/helpers/cache_helper.dart';


final dio = sl<DioHelper>();

class DioHelper {
  static const String _baseUrl = ApiConstant.baseUrl;

  final Dio _dio = Dio(BaseOptions(
    baseUrl: _baseUrl,
    receiveDataWhenStatusError: true,
  ));

  /// get
  Future<ResponseModel> get(
      {required String endPoint,
        Map<String, dynamic>? query,
        Map<String, dynamic> data = const {},
        String? token,
        bool showErrorMessage = true,
        ProgressCallback? onReceiveProgress}) async {
    try {
      _dio.options.headers = {'Authorization': "Bearer ${CacheVars.token}"};
      final response = await _dio.get(endPoint,
          data: jsonEncode(data),
          queryParameters: query,
          onReceiveProgress: onReceiveProgress);
      ResponseModel responseModel=  ResponseModel.fromJson(response.data);
      // print(responseModel.data);
      if(responseModel.status?.toLowerCase()!="success"){
        if (responseModel.message != null) {
          // Toasters.show(responseModel.message ?? "",duration: 3);
          showCustomSnackBar(responseModel.message ?? "", context: RouterApp.currentContext!,isError: true);
          throw AppException(responseModel.message);
        }
      }
      return ResponseModel.fromJson(response.data);
    } on DioException catch (error) {
      if (error.response != null) {
        final data = error.response?.data;
        if (data != null && data.toString().isNotEmpty) {
          final responseModel = ResponseModel.fromJson(data);
          if (responseModel.message != null) {
            if (showErrorMessage) {
              // Toasters.show(responseModel.message ?? "");
              showCustomSnackBar(responseModel.message ?? "", context: RouterApp.currentContext!,isError: true);

            }
          }
        }
        throw AppException(error.response?.statusMessage ?? "");
      } else {
        throw AppException(error.message ?? 'حدث خطأ');
      }
    } on SocketException {
      throw AppException('No Internet connection');
    } on FormatException catch (e) {
      throw AppException(e.toString());
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  /// post
  Future<ResponseModel> post(
      {required String endPoint,
        Map<String, dynamic> data = const {},
        bool isFormData=false,
        Map<String, dynamic>? query,
        String? token,
        bool isErrorMessage = true,
        ProgressCallback? onSendProgress}) async {
    try {
      _dio.options.headers = {
        'Content-Type':isFormData?'multipart/form-data': 'application/json',
        'Authorization': "Bearer ${CacheVars.token}"
      };

      final response = await _dio.post(
        endPoint,
        data:isFormData?FormData.fromMap(data): jsonEncode(data),
        queryParameters: query,
        onSendProgress: onSendProgress,
      );
      ResponseModel responseModel=  ResponseModel.fromJson(response.data);
      if(responseModel.status?.toLowerCase()!="success"&&responseModel.status!=null){
        if (responseModel.message != null) {
          // Toasters.show(responseModel.message ?? "",duration: 3);

          if(isErrorMessage){
            showCustomSnackBar(responseModel.message ?? "", context: RouterApp.currentContext!,isError: true);

          }
          throw AppException(responseModel.message);
        }
      }
      return ResponseModel.fromJson(response.data);
    } on DioException catch (error) {
      if (error.response?.statusCode==302) {
        await CacheHelper.removeData(PrefKeys.userData);
        await CacheHelper.removeData(PrefKeys.token);
        // Toasters.show('يجب تسجيل الدخول');
        showCustomSnackBar('يجب تسجيل الدخول', context: RouterApp.currentContext!,isError: true);

      }
      if (error.response != null) {
        final data = error.response?.data;
        if (data != null && data.toString().isNotEmpty) {
          final responseModel = ResponseModel.fromJson(data);
          if (responseModel.message != null) {

            if(isErrorMessage){
              showCustomSnackBar(responseModel.message ?? "", context: RouterApp.currentContext!,isError: true);

            }
          }
        }
        throw AppException(error.response!.statusMessage!);
      } else {
        throw AppException(error.message ?? 'حدث خطأ');
      }
    } on SocketException {
      throw AppException("Error connecting to internet");
    } on FormatException catch (e) {
      throw AppException(e.toString());
    } catch (e) {
      throw AppException(e.toString());
    }
  }
  /// post
  Future<ResponseModel2> postList(
      {required String endPoint,
        Map<String, dynamic> data = const {},
        bool isFormData=false,
        Map<String, dynamic>? query,
        String? token,
        ProgressCallback? onSendProgress}) async {
    try {
      _dio.options.headers = {
        'Content-Type':isFormData?'multipart/form-data': 'application/json',
        'Authorization': "Bearer ${CacheVars.token}"
      };

      final response = await _dio.post(
        endPoint,
        data:isFormData?FormData.fromMap(data): jsonEncode(data),
        queryParameters: query,
        onSendProgress: onSendProgress,
      );
      ResponseModel2 responseModel=  ResponseModel2.fromJson(response.data);
      if(responseModel.status?.toLowerCase()!="success"&&responseModel.status!=null){
        if (responseModel.message != null) {
          // Toasters.show(responseModel.message ?? "",duration: 3);
          showCustomSnackBar(responseModel.message ?? "", context: RouterApp.currentContext!,isError: true);

          throw AppException(responseModel.message);
        }
      }
      return ResponseModel2.fromJson(response.data);
    } on DioException catch (error) {
      if (error.response?.statusCode==302) {
        await CacheHelper.removeData(PrefKeys.userData);
        await CacheHelper.removeData(PrefKeys.token);
        // Toasters.show('يجب تسجيل الدخول');
        showCustomSnackBar('يجب تسجيل الدخول', context: RouterApp.currentContext!,isError: true);

      }
      if (error.response != null) {
        final data = error.response?.data;
        if (data != null && data.toString().isNotEmpty) {
          final responseModel = ResponseModel.fromJson(data);
          if (responseModel.message != null) {
            showCustomSnackBar(responseModel.message ?? "", context: RouterApp.currentContext!,isError: true);

          }
        }
        throw AppException(error.response!.statusMessage!);
      } else {
        throw AppException(error.message ?? 'حدث خطأ');
      }
    } on SocketException {
      throw AppException("Error connecting to internet");
    } on FormatException catch (e) {
      throw AppException(e.toString());
    } catch (e) {
      throw AppException(e.toString());
    }
  }
  /// put
  Future<ResponseModel> put(
      {required String endPoint,
        Map<String, dynamic> data = const {},
        Map<String, dynamic>? query,
        String? token,
        ProgressCallback? onSendProgress}) async {
    try {
      _dio.options.headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${CacheVars.token}"
      };

      final response = await _dio.put(
        endPoint,
        data: jsonEncode(data),

        // data: FormData.fromMap(data),
        queryParameters: query,
        onSendProgress: onSendProgress,
      );

      return ResponseModel.fromJson(response.data);
    } on DioException catch (error) {
      if (error.response != null) {
        final data = error.response?.data;
        if (data != null && data.toString().isNotEmpty) {
          final responseModel = ResponseModel.fromJson(data);
          if (responseModel.message != null) {
            showCustomSnackBar(responseModel.message ?? "", context: RouterApp.currentContext!,isError: true);

            // Toasters.show(responseModel.message ?? "");
          }
        }
        throw AppException(error.response?.statusMessage);
      } else {
        throw AppException(error.message ?? 'حدث خطأ');
      }
    } on SocketException {
      throw AppException("Error connecting to internet");
    } on FormatException catch (e) {
      throw AppException(e.toString());
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  /// delete
  Future<ResponseModel> delete({
    required String endPoint,
    Map<String, dynamic> data = const {},
    Map<String, dynamic>? query,
    String? token,
  }) async {
    try {
      _dio.options.headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${CacheVars.token}"
      };
      final response = await _dio.delete(endPoint,
          data: jsonEncode(data),

          // data: FormData.fromMap(data),
          queryParameters: query);
      return ResponseModel.fromJson(response.data);
    } on DioException catch (error) {
      if (error.response != null) {
        final data = error.response?.data;
        if (data != null && data.toString().isNotEmpty) {
          return ResponseModel.fromJson(data);
        }
        throw AppException(error.response!.statusMessage!);
      } else {
        throw AppException(error.message ?? 'حدث خطأ');
      }
    } on SocketException {
      throw AppException("Error connecting to internet");
    } on FormatException catch (e) {
      throw AppException(e.toString());
    } catch (e) {
      throw AppException(e.toString());
    }
  }
}
