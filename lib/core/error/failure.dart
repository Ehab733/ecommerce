import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure()
    : super("No Internet connection. Please check your network and try again.");
}

class ErrorHandler {
  static Failure handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return const ServerFailure("Connection timeout with server.");
        case DioExceptionType.sendTimeout:
          return const ServerFailure("Send timeout. Please try again.");
        case DioExceptionType.receiveTimeout:
          return const ServerFailure("Receive timeout from server.");
        case DioExceptionType.connectionError:
          return const NetworkFailure();
        case DioExceptionType.badResponse:
          return _handleResponseError(error.response);
        case DioExceptionType.cancel:
          return const ServerFailure("Request was cancelled.");
        default:
          return const ServerFailure("An unexpected error occurred.");
      }
    } else {
      return ServerFailure(error.toString().replaceAll("Exception: ", ""));
    }
  }

  static Failure _handleResponseError(Response? response) {
    if (response != null && response.data != null) {
      final data = response.data;

      if (data is Map<String, dynamic>) {
        // 🎯 1. تجاهل statusMsg وقراءة message المباشرة
        if (data.containsKey('message') &&
            data['message'] != null &&
            data['message'].toString().toLowerCase() != 'fail') {
          return ServerFailure(data['message'].toString());
        }

        // 🎯 2. التعامل مع أخطاء الـ Validation التفصيلية (مثل الـ Email المكرر)
        if (data.containsKey('errors') && data['errors'] != null) {
          if (data['errors'] is Map && data['errors']['msg'] != null) {
            return ServerFailure(data['errors']['msg'].toString());
          }
        }
      } else if (data is String && data.isNotEmpty) {
        return ServerFailure(data);
      }
    }

    // 🛡️ Fallback رسائل مخصصة حسب كود الخطأ في حال عدم وجود message في الـ Body
    switch (response?.statusCode) {
      case 400:
      case 401:
        return const ServerFailure("Incorrect email or password.");
      case 409:
        return const ServerFailure("Account already exists.");
      case 500:
        return const ServerFailure("Server error. Please try again later.");
      default:
        return const ServerFailure("Something went wrong. Please try again.");
    }
  }
}
