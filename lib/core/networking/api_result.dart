import 'package:tasky/core/networking/error_handling.dart';

abstract class ApiResult<T> {
  const ApiResult();

  factory ApiResult.success(T data) = Success<T>;

  factory ApiResult.failure(ErrorHandler errorHandler) = Failure<T>;

  R when<R>({
    required R Function(T data) success,
    required R Function(ErrorHandler errorHandler) failure,
  }) {
    if (this is Success<T>) {
      return success((this as Success<T>).data);
    } else if (this is Failure<T>) {
      return failure((this as Failure<T>).errorHandler);
    }
    throw Exception('Unsupported type');
  }
}

/// Success case containing data.
class Success<T> extends ApiResult<T> {
  final T data;

  const Success(this.data);
}

/// Failure case containing an error handler.
class Failure<T> extends ApiResult<T> {
  final ErrorHandler errorHandler;

  const Failure(this.errorHandler);
}
