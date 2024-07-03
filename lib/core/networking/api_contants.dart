class ApiConstants {
  static const String apiBaseUrl = "https://vcare.integration25.com/api/";
  static const String loginUrl = "auth/login";
}
// ApiConstants class contains static constant strings for API base URL and login URL.

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
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
// ApiErrors class contains static constant strings for various error types,
// messages, and status codes that can be encountered during API interactions.
// These classes are used to store and access commonly used API constants and
// error messages throughout the application.
