import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:work_env_mobile/services/abstractions/jwt_decoder.dart';
import 'package:work_env_mobile/services/implementations/auth_service.dart';
import 'package:work_env_mobile/services/implementations/date_parser.dart';
import 'package:work_env_mobile/services/implementations/encrypt_service.dart';
import 'package:work_env_mobile/services/implementations/jwtdecoder_service.dart';
import 'package:work_env_mobile/services/implementations/user_service.dart';
import 'package:work_env_mobile/services/implementations/validator_service.dart';
import 'package:work_env_mobile/validations/abstract_validator.dart';
import 'package:work_env_mobile/validations/cpf_cnpj_validator.dart';
import 'package:work_env_mobile/validations/email_validator.dart';
import 'package:work_env_mobile/validations/name_validator.dart';
import 'package:work_env_mobile/validations/password_validator.dart';
import 'package:work_env_mobile/view_models/create_user_viewmodel.dart';
import 'package:work_env_mobile/view_models/home_viewmodel.dart';

final locator = GetIt.instance;

void setupDepencyInjection() {
  // Register DIO (Better and modern Httpclient)
  locator.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        // 10.0.2.2 is the IP Addres that Android simulutor uses to interect with the localhost of your machine
        baseUrl: 'http://10.0.2.2:57399/api',
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Host': 'localhost:57399'
        },
      ),
    );

    //dio.interceptors.add(LogInterceptor());
    //dio.interceptors.add(ErrorInterceptor());
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
      compact: true,
    ));

    return dio;
  });

  // register validators
  locator.registerLazySingleton<IValidator>(
    () => NameValidator(),
    instanceName: 'name',
  );
  locator.registerLazySingleton<IValidator>(
    () => EmailValidator(),
    instanceName: 'email',
  );
  locator.registerLazySingleton<IValidator>(
    () => PasswordValidator(),
    instanceName: 'password',
  );
  locator.registerLazySingleton<IValidator>(
    () => CpfCnpjValidator(),
    instanceName: 'cpfOrCnpj',
  );

  // Register validators list
  locator.registerLazySingleton<List<IValidator>>(
    () => [
      locator<IValidator>(instanceName: 'name'),
      locator<IValidator>(instanceName: 'email'),
      locator<IValidator>(instanceName: 'password'),
      locator<IValidator>(instanceName: 'cpfOrCnpj'),
    ],
  );

  // Register Services
  locator.registerFactory<UserService>(() => UserService(locator<Dio>()));
  locator.registerLazySingleton<AuthService>(() => AuthService(locator<Dio>()));
  locator.registerLazySingleton<CryptoService>(() => CryptoService());
  locator.registerLazySingleton<ValidationService>(
    () => ValidationService(locator<List<IValidator>>()),
  );
  locator.registerFactory<DateParser>(() => DateParser());
  locator.registerFactory<JwtDecoderAbstraction>(() => JwtDecoderImpl());

  // Register ViewModels
  locator.registerFactory<CreateUserViewModel>(() => 
    CreateUserViewModel(locator<UserService>(), locator<CryptoService>()));
  locator.registerFactory<HomeViewModel>(() => 
    HomeViewModel(locator<JwtDecoderAbstraction>(), locator<AuthService>()));
}

class LogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('Request: ${options.method} ${options.path}');
    super.onRequest(options, handler);
  }
}
