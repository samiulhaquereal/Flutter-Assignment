import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as fd;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RestApi {

  static RestApi? _instance;
  RestApi._internal();
  factory RestApi(){
    _instance ??= RestApi._internal();
    return _instance!;
  }

  Dio _createDioInstance(String baseUrl) {
    final _dio = Dio()
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = Duration(minutes: 5)
      ..options.receiveTimeout = Duration(minutes: 5)
      ..options.responseType = ResponseType.json
      ..interceptors.add(PrettyDioLogger());
    return _dio;
  }


  Future<dynamic> get({required String baseURL,required String endpoint,Map<String, dynamic>? params}) async {
    return _sendRequest(
        method: 'GET',
        baseURL: baseURL,
        endpoint: endpoint,
        params: params
    );
  }


  Future<dynamic> _sendRequest<T> ({required String baseURL, required String method, bool? needEncode, required String endpoint, dynamic? data, Map<String, dynamic>? params,fd.FormData? formData,bool? chatLoading = true}) async {

    try {
      final _dio = _createDioInstance(baseURL);
      EasyLoading.show(status: 'loading...');
      final response = await _dio.request(
        endpoint,
        queryParameters: params,
        data: needEncode == true ? jsonEncode(data) : data,
        options: Options(
            method: method,
            responseType: ResponseType.json
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (T == dynamic || T == Map<String, dynamic>) {
          EasyLoading.dismiss();
          return  response.data;
        } else if (T == List<dynamic>) {
          if (response.data is List<dynamic>) {
            EasyLoading.dismiss();
            return response.data;
          } else {
            throw Exception('Expected a List<dynamic> but received: ${response.data}');
          }
        } else {
          throw Exception('Unsupported type: $T');
        }
      } else {
        log('Request failed with status: ${response.statusCode}');
        EasyLoading.showError(
            'Request failed with status: ${response.statusCode}');
        throw Exception('Failed to make GET request');
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.data != null) {
        final errorMessage = e.response!.data['messageCode'];
        EasyLoading.dismiss();
        return {'message':errorMessage};
      } else {
        EasyLoading.dismiss();
        final errorMessage = e.response!.data['messageCode'];
        return {'message':errorMessage};
      }
    }catch (e) {
      log('Error occurred while making $method request: $e');
      throw Exception('Failed to make $method request: $e');
    }
  }
}