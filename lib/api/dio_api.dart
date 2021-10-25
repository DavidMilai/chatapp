import 'dart:convert';

import 'package:dio/dio.dart';

class DioApi {
  late Dio dio;

  DioApi(String apiUrl) {
    dio = Dio();
    dio.options.baseUrl = apiUrl;
    dio.interceptors.add(InterceptorsWrapper(onRequest: _requestIntercept));
    dio.interceptors.add(InterceptorsWrapper(onResponse: _responseIntercept));
    dio.interceptors.add(InterceptorsWrapper(onError: _errorIntercept));
  }

  _requestIntercept(RequestOptions options, handler) async {
    print(
        "REQUEST: ${options?.method}: ${options?.baseUrl}${options?.path} ${options?.queryParameters}");
    print(
        "BODY: ${(options?.data != null && !(options?.data is FormData)) ? json.encode(options?.data) : ""}");

    // if (authService.isLoggedIn) {
    //   options.headers.addAll(
    //     {
    //       "token": "${authService.authData.token}",
    //       "phone-number": "${authService.authData.phoneNumber}",
    //     },
    //   );
    // }
    return handler.next(options); //continue
  }

  _responseIntercept(Response response, handler) async {
    print("${response.requestOptions.path} ${response?.data}");
    return handler.next(response); // continue
  }

  _errorIntercept(DioError error, handler) async {
    print("${error.requestOptions.path} ${error.response?.data}");
    return handler.next(error);
  }
}
