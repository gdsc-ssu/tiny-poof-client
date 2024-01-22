import 'package:dio/dio.dart';

class NetworkService {
  static Dio? _instance;

  static Future<void> init() async {
    _instance = Dio(
      BaseOptions(
        baseUrl: 'https://www.naver.com',
        connectTimeout: const Duration(seconds: 3),
        receiveTimeout: const Duration(seconds: 3),
      ),
    );
    _instance!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options,
            RequestInterceptorHandler handler) async {},
      ),
    );
  }

  static Dio get instance => _instance!;
}
