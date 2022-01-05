import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:messenger/models/response/login_response.dart';
class LoginProvider {
  late Dio _dio;
  LoginProvider() {
    _dio = Dio()
      ..interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }
  Future<LoginResponse> getData() async {
    Response response = await _dio.get(
      "https://61951e9274c1bd00176c6b93.mockapi.io/api/v1/login",
    );
    return LoginResponse.fromJson(response.data ?? "");
  }
}