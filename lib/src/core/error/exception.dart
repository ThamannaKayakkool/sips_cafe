import 'package:equatable/equatable.dart';

class ServerException extends Equatable {
  const ServerException({required this.message, required this.statusCode});

  final String message;
  final dynamic statusCode;

  String get errorMessage => message;

  @override
  List<Object?> get props => [message, statusCode];
}
