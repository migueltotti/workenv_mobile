import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:work_env_mobile/error/exceptions/app_exception.dart';
import 'package:work_env_mobile/error/exceptions/dio_exepctions/cancel_exception.dart';
import 'package:work_env_mobile/error/exceptions/dio_exepctions/network_exception.dart';
import 'package:work_env_mobile/error/exceptions/dio_exepctions/timeout_exception.dart';
import 'package:work_env_mobile/error/exceptions/dio_exepctions/unkown_exception.dart';
import 'package:work_env_mobile/error/exceptions/http_exceptions/api_exception.dart';
import 'package:work_env_mobile/error/exceptions/http_exceptions/badrequest_exception.dart';
import 'package:work_env_mobile/error/exceptions/http_exceptions/forbidden_exception.dart';
import 'package:work_env_mobile/error/exceptions/http_exceptions/notfound_exception.dart';
import 'package:work_env_mobile/error/exceptions/http_exceptions/server_exception.dart';
import 'package:work_env_mobile/error/exceptions/http_exceptions/unauthorized_exception.dart';
import 'package:work_env_mobile/error/exceptions/http_exceptions/validation_exception.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Log para debug
    log("ErrorInterceptor - Type: ${err.type}, Message: ${err.message}");
    log("ErrorInterceptor - StatusCode: ${err.response?.statusCode}");
    
    try {
      AppException exception = _createAppException(err);
      
      // Mantém todas as propriedades originais da DioException
      handler.reject(DioException(
        requestOptions: err.requestOptions,
        response: err.response, // IMPORTANTE: Manter a response original
        error: exception,
        type: err.type,
        message: exception.message,
        stackTrace: err.stackTrace,
      ));
    } catch (e) {
      // Se algo der errado no interceptor, passa o erro original
      log("ErrorInterceptor failed: $e");
      handler.next(err);
    }
  }

  AppException _createAppException(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException('Timeout na conexão');
        
      case DioExceptionType.badResponse:
        return _handleStatusCode(err);
        
      case DioExceptionType.connectionError:
        return NetworkException('Erro de conexão');
        
      case DioExceptionType.cancel:
        return CancelException('Requisição cancelada');
        
      case DioExceptionType.unknown:
        return UnknownException('Erro desconhecido: ${err.message ?? "Falha na conexão"}');
        
      case DioExceptionType.badCertificate:
        return NetworkException('Certificado SSL inválido');
        
      default:
        return UnknownException('Tipo de erro não mapeado: ${err.type}');
    }
  }

  AppException _handleStatusCode(DioException err) {
    final statusCode = err.response?.statusCode;
    
    // Tratamento mais seguro dos dados da resposta
    String message = err.response!.data;
    dynamic errors;
    
    try {
      final responseData = err.response?.data;
      if (responseData is Map<String, dynamic>) {
        message = responseData['message']?.toString() ?? message;
        errors = responseData['errors'];
      } else if (responseData is String) {
        message = responseData;
      }
    } catch (e) {
      log("Erro ao processar response data: $e");
      // Mantém mensagem padrão se não conseguir processar
    }
    
    switch (statusCode) {
      case 400:
        return BadRequestException(message);
      case 401:
        _handleUnauthorized();
        return UnauthorizedException('Token inválido ou expirado');
      case 403:
        return ForbiddenException('Acesso negado');
      case 404:
        return NotFoundException('Recurso não encontrado');
      case 422:
        return ValidationException(message, errors);
      case 500:
        return ServerException('Erro interno do servidor');
      default:
        return ApiException('Erro HTTP $statusCode: $message');
    }
  }
  
  void _handleUnauthorized() {
    // locator<AuthService>().logout();
    // try refreshToken login
    // navigate to login page if refreshToken login fails
    // locator<NavigationService>().pushAndRemoveUntil('/login');
  }
}