import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:messenger/models/response/login_response.dart';
import 'package:messenger/models/response/user_response.dart';
class UserProvider {
  late Dio _dio;
  UserProvider() {
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
  Future<UserResponse> getData() async {
    Response response = await _dio.get(
      "https://61951e9274c1bd00176c6b93.mockapi.io/api/v1/user",
    );
    return UserResponse.fromJson(response.data ?? "");
  }
}