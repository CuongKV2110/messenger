import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:messenger/models/response/story_response.dart';
class StoryProvider {
  late Dio _dio;
  StoryProvider() {
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
  Future<StoryResponse> getData() async {
    Response response = await _dio.get(
      "https://61951e9274c1bd00176c6b93.mockapi.io/api/v1/story",
    );
    return StoryResponse.fromJson(response.data ?? "");
  }
}