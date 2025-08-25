import 'package:work_env_mobile/error/exceptions/http_exceptions/api_exception.dart';

class UnauthorizedException extends ApiException {
  const UnauthorizedException(super.message);
}