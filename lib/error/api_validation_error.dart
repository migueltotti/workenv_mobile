class ApiValidationError {
  final String propertyName;
  final String errorMessage;
  final String attemptedValue;
  final String? customState;
  final int severity;
  final String errorCode;

  ApiValidationError({required this.propertyName, required this.errorMessage, required this.attemptedValue, required this.customState, required this.severity, required this.errorCode});
}

class MessagePlaceHolderValues{
  final String propertyName;
  final String propertyValue;
  final String propertyPath;

  MessagePlaceHolderValues({required this.propertyName, required this.propertyValue, required this.propertyPath});
}