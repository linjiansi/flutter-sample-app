import 'package:dio/dio.dart';
import 'package:flutter_sample_app/data/api/api_client.dart';

class Repository {
  late ApiClient apiClient;

  Repository() {
    BaseOptions baseOptions = BaseOptions(
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      receiveTimeout: 30 * 1000,

    );
    Dio dio = Dio(baseOptions);
    apiClient = ApiClient(dio);
  }
}
