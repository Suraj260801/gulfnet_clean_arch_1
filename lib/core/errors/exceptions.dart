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
  ServerException(super.message, {super.statusCode});
}


/// Exception thrown when there's an issue with local data storage.
class CacheException extends AppExceptions {
  CacheException(super.message, {super.statusCode});
}


/// Exception thrown when there's no internet connection.
class NetworkException extends AppExceptions {
  NetworkException(super.message, {super.statusCode});
}


/// Exception thrown for general client-side errors (e.g., bad request 400).
class ClientException extends AppExceptions {
  ClientException(super.message, {super.statusCode});
}

class DataParsingException extends AppExceptions{
  DataParsingException(super.message,{super.statusCode});
}

class UnknownException extends AppExceptions{
  UnknownException(super.message,{super.statusCode});

}