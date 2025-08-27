import 'package:work_env_mobile/validations/abstract_validator.dart';

class PasswordValidator implements IValidator {
  final _passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).{8,30}$');

  @override
  String get fieldName => 'password';

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password must be not null or empty';
    }
    if (!_passwordRegex.hasMatch(value)) {
      return 'Password must be 8-30 chars, include upper, lower, and special character';
    }
    return null;
  }
}
