import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message});
  final String message;
  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, required this.statusCode});

  final int statusCode;
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.message, required this.statusCode});

  final int statusCode;
}

class UnknownFailure extends Failure {
  const UnknownFailure({required super.message});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}

class AuthFailure extends Failure {
  const AuthFailure({required super.message});
}