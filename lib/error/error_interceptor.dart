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

class ErrorInterceptor extends Interceptor{
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppException exception;

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        exception = TimeoutException('Timeout na conexão');
        break;
        
      case DioExceptionType.badResponse:
        exception = _handleStatusCode(err);
        break;
        
      case DioExceptionType.connectionError:
        exception = NetworkException('Erro de conexão');
        break;
        
      case DioExceptionType.cancel:
        exception = CancelException('Requisição cancelada');
        break;
        
      default:
        exception = UnknownException('Erro desconhecido: ${err.message}');
    }
    
    // Rejeita com nossa exceção customizada
    handler.reject(DioException(
      requestOptions: err.requestOptions,
      error: exception,
      type: err.type,
    ));
  }

  AppException _handleStatusCode(DioException err) {
    final statusCode = err.response?.statusCode;
    final message = err.response?.data?['message'] ?? 'Erro no servidor';
    
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
        return ValidationException(message, err.response?.data?['errors']);
      case 500:
        return ServerException('Erro interno do servidor');
      default:
        return ApiException('Erro HTTP $statusCode: $message');
    }
  }
  
  void _handleUnauthorized() {
    //locator<AuthService>().logout();
    // try refreshToken login
    // navigate to login page if refreshToken login fails
    //locator<NavigationService>().pushAndRemoveUntil('/login');
  }
}
