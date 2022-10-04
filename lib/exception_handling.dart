import 'dart:convert';

import 'package:api_exception/exception.dart';
import 'package:http/http.dart';

ErrorType errorTypeFromStatusCode(int statusCode) {
  switch (statusCode) {
    case 400:
      return ErrorType.badRequest;
    case 401:
      return ErrorType.unauthorized;
    case 402:
      return ErrorType.paymentRequired;
    case 403:
      return ErrorType.forbidden;
    case 404:
      return ErrorType.notFound;
    case 405:
      return ErrorType.methodNotAllowed;
    case 406:
      return ErrorType.notAcceptable;
    case 500:
      return ErrorType.internalServerError;
    case 501:
      return ErrorType.notImplemented;
    case 502:
      return ErrorType.badGateway;
    default:
      return ErrorType.unknown;
  }
}

AppException errorResponse(ErrorType type) {
  switch (type) {
    case ErrorType.badRequest:
      return const BadRequest();
    case ErrorType.unauthorized:
      return const Unauthorized();
    case ErrorType.paymentRequired:
      return const PaymentRequired();
    case ErrorType.forbidden:
      return const Forbidden();
    case ErrorType.notFound:
      return const NotFound();
    case ErrorType.methodNotAllowed:
      return const MethodNotAllowed();
    case ErrorType.notAcceptable:
      return const NotAcceptable();
    case ErrorType.internalServerError:
      return const InternalServerError();
    case ErrorType.notImplemented:
      return const NotImplemented();
    case ErrorType.badGateway:
      return const BadGateway();
    default:
      return const UnknownException();
  }
}

class ExceptionHandling {
  static void handelAPIError({
    required int desireStatusCode,
    required Response response,
  }) {
    if (desireStatusCode == response.statusCode) {
      return;
    }
    try {
      ErrorType _errorType = errorTypeFromStatusCode(response.statusCode);
      if (_errorType == ErrorType.unknown) {
        var jsonData = json.decode(response.body);
        var errorMsg = jsonData['error'];
        var errorMsg2 = jsonData['message'];
        throw UnknownException(
          message: errorMsg ?? errorMsg2,
        );
      } else {
        throw errorResponse(_errorType);
      }
    } on AppException {
      rethrow;
    } catch (e) {
      throw UnknownException(
        message: e.toString(),
      );
    }
  }
}
