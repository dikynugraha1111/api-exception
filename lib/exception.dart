import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AppException extends Equatable implements Exception {
  final String? message;
  final ErrorType type;

  const AppException(
    this.type, {
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
        type,
      ];
}

class BadRequest extends AppException {
  const BadRequest({
    String? message,
    ErrorType errorType = ErrorType.badRequest,
  }) : super(errorType, message: message);
}

class Unauthorized extends AppException {
  const Unauthorized({
    String? message,
    ErrorType errorType = ErrorType.unauthorized,
  }) : super(errorType, message: message);
}

class PaymentRequired extends AppException {
  const PaymentRequired({
    String? message,
    ErrorType errorType = ErrorType.paymentRequired,
  }) : super(errorType, message: message);
}

class Forbidden extends AppException {
  const Forbidden({
    String? message,
    ErrorType errorType = ErrorType.forbidden,
  }) : super(errorType, message: message);
}

class NotFound extends AppException {
  const NotFound({
    String? message,
    ErrorType errorType = ErrorType.notFound,
  }) : super(errorType, message: message);
}

class MethodNotAllowed extends AppException {
  const MethodNotAllowed({
    String? message,
    ErrorType errorType = ErrorType.methodNotAllowed,
  }) : super(errorType, message: message);
}

class NotAcceptable extends AppException {
  const NotAcceptable({
    String? message,
    ErrorType errorType = ErrorType.notAcceptable,
  }) : super(errorType, message: message);
}

class InternalServerError extends AppException {
  const InternalServerError({
    String? message,
    ErrorType errorType = ErrorType.internalServerError,
  }) : super(errorType, message: message);
}

class NotImplemented extends AppException {
  const NotImplemented({
    String? message,
    ErrorType errorType = ErrorType.notImplemented,
  }) : super(errorType, message: message);
}

class BadGateway extends AppException {
  const BadGateway({
    String? message,
    ErrorType errorType = ErrorType.badGateway,
  }) : super(errorType, message: message);
}

class LoginFailed extends AppException {
  const LoginFailed({
    String? message,
    ErrorType errorType = ErrorType.loginFailed,
  }) : super(errorType, message: message);
}

class Unauthenticated extends AppException {
  const Unauthenticated({
    String? message,
    ErrorType errorType = ErrorType.unauthenticated,
  }) : super(errorType, message: message);
}

class UnknownException extends AppException {
  const UnknownException({
    String? message,
    ErrorType errorType = ErrorType.unknown,
  }) : super(errorType, message: message);
}

enum ErrorType {
  badRequest, //400
  unauthorized, //401
  paymentRequired, //402
  forbidden, //403
  notFound, //404
  methodNotAllowed, //405
  notAcceptable, //406
  internalServerError, //500
  notImplemented, //501
  badGateway, //502
  loginFailed, //auth0
  unauthenticated, //auth0
  unknown, //unknown
}

extension ErrorTypeExt on ErrorType {
  String rawValue(BuildContext context) {
    switch (this) {
      case ErrorType.badRequest:
        return "Bad Request";

      case ErrorType.unauthorized:
        return "Unauthorized";

      case ErrorType.paymentRequired:
        return "Payment Required";

      case ErrorType.loginFailed:
        return "Login Failed";

      case ErrorType.unauthenticated:
        return "Unauthenticated";

      case ErrorType.unknown:
        return "Unknown Error";

      case ErrorType.forbidden:
        return "Forbidden";

      case ErrorType.notFound:
        return "Not Found";

      case ErrorType.methodNotAllowed:
        return "Method Not Allowed";

      case ErrorType.notAcceptable:
        return "Not Acceptable";

      case ErrorType.internalServerError:
        return "Internal Server Error";

      case ErrorType.notImplemented:
        return "Not Implemented";

      case ErrorType.badGateway:
        return "Bad Gateway";
    }
  }
}

extension AppExtensionExt on AppException {
  String errorMessage(
    BuildContext context, {
    String? badRequestMessage,
    String? unauthorizedMessage,
    String? paymentRequiredMessage,
    String? loginFailedMessage,
    String? unauthenticatedMessage,
    String? forbiddenMessage,
    String? notFoundMessage,
    String? methodNotAllowedMessage,
    String? notAcceptableMessage,
    String? internalServerErrorMessage,
    String? notImplementedMessage,
    String? badGatewayMessage,
  }) {
    switch (type) {
      case ErrorType.badRequest:
        return badRequestMessage ?? type.rawValue(context);
      case ErrorType.unauthorized:
        return unauthenticatedMessage ?? type.rawValue(context);
      case ErrorType.paymentRequired:
        return paymentRequiredMessage ?? type.rawValue(context);
      case ErrorType.loginFailed:
        return loginFailedMessage ?? type.rawValue(context);
      case ErrorType.unauthenticated:
        return unauthenticatedMessage ?? type.rawValue(context);
      case ErrorType.unknown:
        return message ?? type.rawValue(context);
      case ErrorType.forbidden:
        return forbiddenMessage ?? type.rawValue(context);
      case ErrorType.notFound:
        return notFoundMessage ?? type.rawValue(context);
      case ErrorType.methodNotAllowed:
        return methodNotAllowedMessage ?? type.rawValue(context);
      case ErrorType.notAcceptable:
        return notAcceptableMessage ?? type.rawValue(context);
      case ErrorType.internalServerError:
        return internalServerErrorMessage ?? type.rawValue(context);
      case ErrorType.notImplemented:
        return notImplementedMessage ?? type.rawValue(context);
      case ErrorType.badGateway:
        return badGatewayMessage ?? type.rawValue(context);
      default:
        return "Unknown Error Message";
    }
  }
}
