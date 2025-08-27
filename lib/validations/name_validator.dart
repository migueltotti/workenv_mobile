import 'package:work_env_mobile/validations/abstract_validator.dart';

class NameValidator implements IValidator {

  @override
  String get fieldName => 'name';

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name must be not null or empty!';
    }
    if (value.length < 3) {
      return 'Name must have at least 3 chars!';
    }
    if (value.trim()[0] == value.trim()[0].toLowerCase()) {
      return 'Name must have the first letter in upper case!';
    }
    return null;
  }
}
