import 'package:work_env_mobile/error/exceptions/http_exceptions/api_exception.dart';

class ValidationException extends ApiException {
  final Map<String, List<String>>? errors;
  const ValidationException(super.message, this.errors);
}