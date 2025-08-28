import 'package:work_env_mobile/error/api_error_description.dart';
import 'package:work_env_mobile/error/api_validation_error.dart';

class ApiErrorResponse{
  final int statusCode;
  final String title;
  final String type;
  final ApiErrorDescription error;
  final List<ApiValidationError> validationErrors;

  ApiErrorResponse({required this.statusCode, required this.title, required this.type, required this.error, required this.validationErrors});
}