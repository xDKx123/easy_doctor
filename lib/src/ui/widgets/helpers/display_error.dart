import 'package:equatable/equatable.dart';

abstract class DisplayError extends Equatable {
  const DisplayError();
}

class HttpRequestError extends DisplayError {
  const HttpRequestError({required this.errorCode, required this.message});

  final int errorCode;
  final String message;

  @override
  List<Object?> get props => <Object>[errorCode, message];
}

class UnknownError extends DisplayError {
  const UnknownError({required this.message});

  final String message;

  @override
  List<Object?> get props => <Object>[message];
}
