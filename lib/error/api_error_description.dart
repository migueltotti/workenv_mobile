class ApiErrorDescription{
  final String code;
  final String description;
  final int httpStatusCode;

  ApiErrorDescription({required this.code, required this.description, required this.httpStatusCode});
}