import 'package:work_env_mobile/validations/abstract_validator.dart';

class ValidationService {
  final Map<String, IValidator> _validators = {};

  ValidationService(List<IValidator> validators){
    for(var validator in validators){
      _validators[validator.fieldName] = validator;
    }
  }

  String? validateField(String fieldName, String? value) {
    final validator = _validators[fieldName];
    return validator?.validate(value);
  }

  Map<String, String?> validateAll(Map<String, String?> fieldValues) {
    Map<String, String?> errors = {};
    
    fieldValues.forEach((fieldName, value) {
      errors[fieldName] = validateField(fieldName, value);
    });
    
    return errors;
  }

  bool isValid(Map<String, String?> fieldValues) {
    return validateAll(fieldValues).values.every((error) => error == null);
  }
}