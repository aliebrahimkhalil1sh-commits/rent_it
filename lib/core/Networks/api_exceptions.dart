import 'package:dio/dio.dart';
import 'package:rent_it/core/Networks/api_error.dart';

class ApiExceptions {
  static ApiError handleError(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    if (data is Map<String, dynamic> && data["message"] != null) {  // اتأكد إن data عبارة عن object/map ينفع أقرأ منه keys.
      return ApiError(message: data["message"], statusCode: statusCode);
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(
          message: "Connection timeout. Please check your internet connection",
        );

      case DioExceptionType.sendTimeout:
        return ApiError(message: "Request,sendTimeout. Please try again");

      case DioExceptionType.receiveTimeout:
        return ApiError(message: "Response,receiveTimeout. Please try again");

      case DioExceptionType.badResponse:
        if (statusCode == 302) {
          return ApiError(
            message:
                "The server redirected the request (302). Check the auth request format or endpoint.",
            statusCode: statusCode,
          );
        }

        String message = "Server error: $statusCode";

        if (data is Map<String, dynamic>) {
          if (data["error"] is Map<String, dynamic> &&
              data["error"]["message"] != null) {
            message = data["error"]["message"].toString();
          } else if (data["message"] != null) {
            message = data["message"].toString();
          }
        } else if (data != null) {
          message = data.toString();
        }

        return ApiError(message: message, statusCode: statusCode);

      default:
        return ApiError(
          message: "An unexpected error occurred. Please try again",
        );
    }
  }
}
