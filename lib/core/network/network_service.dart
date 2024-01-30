import 'dart:developer';

import 'package:dio/dio.dart';

import '../constant/api.dart';



class ApiHelper {
    Dio dio;

  ApiHelper(this.dio) {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        validateStatus: (status) {
          return status! < 600;
        },
      ),
    );
  }

  @override
  Future<Response> get(String url,
      {Map<String, dynamic>? headers,
        queryParameters,
        bool auth = true}) async {
    if (auth) {
      headers = (headers);
    }
    return await dio.get(
      url,
      options: Options(headers: headers),
      queryParameters: queryParameters ?? {},
    );
  }

}