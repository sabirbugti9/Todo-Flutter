import 'package:dio/dio.dart';
import 'constants.dart';
import 'error_model.dart';

enum DataSource {
  // ignore: constant_identifier_names
  NO_CONTENT,
  // ignore: constant_identifier_names
  BAD_REQUEST,
  // ignore: constant_identifier_names
  FORBIDDEN,
  // ignore: constant_identifier_names
  UNAUTORISED,
  // ignore: constant_identifier_names
  NOT_FOUND,
  // ignore: constant_identifier_names
  INTERNAL_SERVER_ERROR,
  // ignore: constant_identifier_names
  CONNECT_TIMEOUT,
  // ignore: constant_identifier_names
  CANCEL,
  // ignore: constant_identifier_names
  RECIEVE_TIMEOUT,
  // ignore: constant_identifier_names
  SEND_TIMEOUT,
  // ignore: constant_identifier_names
  CACHE_ERROR,
  // ignore: constant_identifier_names
  NO_INTERNET_CONNECTION,
  // ignore: constant_identifier_names
  DEFAULT
}

class ResponseCode {
  // ignore: constant_identifier_names
  static const int SUCCESS = 200; // success with data
  // ignore: constant_identifier_names
  static const int NO_CONTENT = 201; // success with no data (no content)
  // ignore: constant_identifier_names
  static const int BAD_REQUEST = 400; // failure, API rejected request
  // ignore: constant_identifier_names
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; // failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found
  static const int API_LOGIC_ERROR = 422; // API logic error

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String NO_CONTENT = ApiErrors.noContent;
  static const String BAD_REQUEST = ApiErrors.badRequestError;
  static const String UNAUTORISED = ApiErrors.unauthorizedError;
  static const String FORBIDDEN = ApiErrors.forbiddenError;
  static const String INTERNAL_SERVER_ERROR = ApiErrors.internalServerError;
  static const String NOT_FOUND = ApiErrors.notFoundError;

  // local status code
  static String CONNECT_TIMEOUT = ApiErrors.timeoutError;
  static String CANCEL = ApiErrors.defaultError;
  static String RECIEVE_TIMEOUT = ApiErrors.timeoutError;
  static String SEND_TIMEOUT = ApiErrors.timeoutError;
  static String CACHE_ERROR = ApiErrors.cacheError;
  static String NO_INTERNET_CONNECTION = ApiErrors.noInternetError;
  static String DEFAULT = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.BAD_REQUEST:
        return ApiErrorModel(
            statusCode: ResponseCode.API_LOGIC_ERROR,
            message: ResponseMessage.BAD_REQUEST);
      case DataSource.DEFAULT:
        return ApiErrorModel(
            statusCode: ResponseCode.DEFAULT, message: ResponseMessage.DEFAULT);
      case DataSource.NO_CONTENT:
        return ApiErrorModel(
            statusCode: ResponseCode.NO_CONTENT,
            message: ResponseMessage.NO_CONTENT);
      case DataSource.FORBIDDEN:
        return ApiErrorModel(
            statusCode: ResponseCode.FORBIDDEN,
            message: ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTORISED:
        return ApiErrorModel(
            statusCode: ResponseCode.UNAUTORISED,
            message: ResponseMessage.UNAUTORISED);
      case DataSource.NOT_FOUND:
        return ApiErrorModel(
            statusCode: ResponseCode.NOT_FOUND,
            message: ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return ApiErrorModel(
            statusCode: ResponseCode.INTERNAL_SERVER_ERROR,
            message: ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return ApiErrorModel(
            statusCode: ResponseCode.CONNECT_TIMEOUT,
            message: ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return ApiErrorModel(
            statusCode: ResponseCode.CANCEL, message: ResponseMessage.CANCEL);
      case DataSource.RECIEVE_TIMEOUT:
        return ApiErrorModel(
            statusCode: ResponseCode.RECIEVE_TIMEOUT,
            message: ResponseMessage.RECIEVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return ApiErrorModel(
            statusCode: ResponseCode.SEND_TIMEOUT,
            message: ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return ApiErrorModel(
            statusCode: ResponseCode.CACHE_ERROR,
            message: ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return ApiErrorModel(
            statusCode: ResponseCode.NO_INTERNET_CONNECTION,
            message: ResponseMessage.NO_INTERNET_CONNECTION);
    }
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;
  ErrorHandler(this.apiErrorModel);
  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      apiErrorModel = _handleError(error);
    } else {
      apiErrorModel = DataSource.DEFAULT.getFailure();
    }
  }
}

ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.unknown:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.NO_INTERNET_CONNECTION.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.DEFAULT.getFailure();
  }
}
