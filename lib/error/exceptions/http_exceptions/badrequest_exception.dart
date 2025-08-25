import 'package:work_env_mobile/error/exceptions/http_exceptions/api_exception.dart';

class BadRequestException extends ApiException {
  const BadRequestException(super.message);
}