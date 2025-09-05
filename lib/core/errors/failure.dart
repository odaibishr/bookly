import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout error please try again later');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout error please try again later');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout error please try again later');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate error please try again later');
      case DioExceptionType.badResponse:
        return ServerFailure('Bad response error please try again later');
      case DioExceptionType.cancel:
        return ServerFailure('Cancel error please try again later');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection error please try again later');
      case DioExceptionType.unknown:
      return ServerFailure('Unknown error please try again later');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 404) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure('Unexpected error occurred');
    }
  }
}
