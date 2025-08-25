import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:work_env_mobile/error/error_interceptor.dart';
import 'package:work_env_mobile/services/auth_service.dart';
import 'package:work_env_mobile/services/encrypt_service.dart';
import 'package:work_env_mobile/services/user_service.dart';

final locator = GetIt.instance;

void setupDepencyInjection() {
  // Register DIO (Better and modern Httpclient)
  locator.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        // 10.0.2.2 is the IP Addres that Android simulutor uses to interect with the localhost of your machine
        baseUrl: 'http://10.0.2.2:8080/api',
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(LogInterceptor());
    dio.interceptors.add(ErrorInterceptor());

    return dio;
  });

  // Register Services
  locator.registerFactory<UserService>(() => UserService(locator<Dio>()));
  locator.registerFactory<AuthService>(() => AuthService(locator<Dio>()));
  locator.registerLazySingleton<EncryptService>(() => EncryptService());
}

class LogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('Request: ${options.method} ${options.path}');
    super.onRequest(options, handler);
  }
}
