class Result<T> {
  bool isSuccess;
  T? value;
  Object? error;

  Result.success({required this.value})
      : isSuccess = true,
        error = null;

  Result.failure({required this.error})
      : isSuccess = false,
        value = null;
}

class ResultVoid{
  bool isSuccess;
  Object? error;

  ResultVoid.success()
      : isSuccess = true,
        error = null;

  ResultVoid.failure({required this.error})
      : isSuccess = false;
}