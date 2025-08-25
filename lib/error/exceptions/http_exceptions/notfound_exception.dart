import 'package:work_env_mobile/error/exceptions/http_exceptions/api_exception.dart';

class NotFoundException extends ApiException {
  const NotFoundException(super.message);
}
