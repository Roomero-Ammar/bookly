import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  /// Factory method to handle different Dio exceptions
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with the API server.");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with the API server.");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout with the API server.");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response?.statusCode, dioError.response?.data);
      case DioExceptionType.cancel:
        return ServerFailure("Request to the API server was canceled.");
      case DioExceptionType.unknown:
        if (dioError.message?.contains('SocketException') ?? false) {
          return ServerFailure("No internet connection.");
        }
        return ServerFailure("Unexpected error: ${dioError.message}");
      default:
        return ServerFailure("Unexpected error, please try again.");
    }
  }

  /// Handle responses with specific status codes and provide detailed messages
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    try {
      final message =
          response?['error']?['message'] ?? 'An unknown error occurred.';
      switch (statusCode) {
        case 400:
        case 401:
        case 403:
          return ServerFailure(message);
        case 404:
          return ServerFailure('Request not found, please try again later.');
        case 429: // Handling Quota Exceeded error
          return ServerFailure(
              'Quota exceeded: You have exceeded the daily API limit. Please try again later.');
        case 500:
          return ServerFailure(
              'Internal server error, please try again later.');
        default:
          return ServerFailure(
            'Error $statusCode: $message',
          );
      }
    } catch (e) {
      return ServerFailure('Failed to parse error: ${response.toString()}');
    }
  }
}
