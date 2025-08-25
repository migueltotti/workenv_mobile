import 'package:work_env_mobile/error/exceptions/http_exceptions/api_exception.dart';

class UnknownException extends ApiException {
  const UnknownException(super.message);
}