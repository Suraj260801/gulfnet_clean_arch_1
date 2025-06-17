/// Base class for all custom exceptions in the application.
abstract class AppExceptions implements Exception {
  final String message;
  final int? statusCode;


  AppExceptions(this.message, {this.statusCode});


  @override
  String toString() {
    return 'AppException: $message${statusCode != null ? ' (Status: $statusCode)' : ''}';
  }
}

/// Exception thrown when a server error occurs (e.g., 500, 404).
class ServerException extends AppExceptions {
  ServerException(String message, {int? statusCode}) : super(message, statusCode: statusCode);
}


/// Exception thrown when there's an issue with local data storage.
class CacheException extends AppExceptions {
  CacheException(String message) : super(message);
}


/// Exception thrown when there's no internet connection.
class NetworkException extends AppExceptions {
  NetworkException(String message) : super(message);
}


/// Exception thrown for general client-side errors (e.g., bad request 400).
class ClientException extends AppExceptions {
  ClientException(String message, {int? statusCode}) : super(message, statusCode: statusCode);
}

class DataParsingException extends AppExceptions{
  DataParsingException(String message,{int? statusCode}): super(message,statusCode: statusCode);
}

class UnknownException extends AppExceptions{
  UnknownException(String message,{int? statusCode}): super(message,statusCode: statusCode);

}