A Flutter package for handling API Exception

## Features

- 400 - 500 status code with normal message error.
- Can customize your error message.

## Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :-----: |
|   ✔️    | ✔️  |  ✔️   | ✔️  |  ✔️   |   ✔️    |

## Getting started

To use this plugin, add api_exception as a dependency in your pubspec.yaml file.

## Usage

Import library

```dart
import 'package:api_exception/api_exception.dart';
```

To handle exception, you can add this code at your service layer.
Don't forget to add catch (on AppException) for rethrowing the error to logic layer/ etc.

```dart
@override
      ExceptionHandling.handelAPIError(
        desireStatusCode: 200, // passed status
        response: response, // your response
      );
```

Example :

```dart
@override
  Future<List<VideoTypesData>> getData() async {
    try {
      final url = _appEndpoint.getData();
      final response = await _httpClient.get(url, {});
      ExceptionHandling.handelAPIError(
        desireStatusCode: 200,
        response: response,
      );
      return VideoTypes.fromJson(response.body).data;
    } on AppException {
      rethrow;
    }
  }
```

To handle error message, you can add this from your View layer

```dart
Text(exception?.errorMessage(context) ?? 'Unknown Error')
```

example :

```dart
 if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar
              ..showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.exception?.errorMessage(context) ?? 'Unknown Error'),
                ),
              );
          }
```

To customize error message, you can do this:

```dart
// Example error code status = 404
Text(exception?.errorMessage(context, notFoundMessage : "Sorry, we can't find your data") ?? 'Unknown Error')
```

For Unknown error. The package will get your error message from json response body ("message" || "error"), or you can modify your error message.

## Additional information

List handle error message :

```dart
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
```
