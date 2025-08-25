import 'package:work_env_mobile/error/exceptions/http_exceptions/api_exception.dart';

class ForbiddenException extends ApiException {
  const ForbiddenException(super.message);
}