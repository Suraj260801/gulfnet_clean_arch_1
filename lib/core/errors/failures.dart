import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final String message;
  final List<Object?> properties;

  const Failure(this.message,[this.properties=const <Object?>[]]);

  @override
  List<Object?> get props => [message,...properties];
}

/// Represents a failure originating from the server.
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}


/// Represents a failure originating from local data operations.
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}


/// Represents a failure due to network connectivity issues.
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}


/// Represents a general client-side failure (e.g., invalid input).
class ClientFailure extends Failure {
  const ClientFailure(super.message);
}


/// Represents an unexpected or unknown failure.
class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message);
}
