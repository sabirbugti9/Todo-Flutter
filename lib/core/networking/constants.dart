class ApiConstants {
  static const String baseUrl = "https://todo.iraqsapp.com/";
  static const String login = 'auth/login';
  static const String sigIn = 'auth/register';
  static const String getTasks = 'todos';
  static const String refreshTToken = 'auth/refresh-token';
  static const String deleteTask = 'todos';
  static const String updateTask = 'todos';
  static const String profile = 'auth/profile';
  static const String createTask = 'todos';
}

/*   */
class ApiErrors {
  static const String badRequestError = "رقم الهاتف مستخدم بالفعل";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError =
      "يوجد خطأ في رقم الهاتف أو كلمة المرور";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
