import 'package:work_env_mobile/validations/abstract_validator.dart';

class CpfCnpjValidator implements IValidator {
  final _cpfCnpjRegex = RegExp(
    r'^(\d{3}\.\d{3}\.\d{3}-\d{2}|\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2})$',
  );

  @override
  String get fieldName => 'cpfOrCnpj';

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Cpf or Cnpj must be not null or empty!';
    }
    if (!_cpfCnpjRegex.hasMatch(value)) {
      return 'Cpf or Cnpj must be in the corret format!';
    }
    return null;
  }
}
