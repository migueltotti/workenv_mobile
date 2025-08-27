import 'package:work_env_mobile/validations/abstract_validator.dart';

class EmailValidator implements IValidator {

  @override
  String get fieldName => 'email';

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email must be not null or empty!';
    }
    if (!value.contains('@')) {
      return 'Email must be in the corret format, missing `@`';
    }
    return null;
  }
}
