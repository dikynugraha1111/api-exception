import 'package:api_exception/api_exception.dart';
import 'package:http/http.dart' as http;

abstract class HomeService {
  Future<bool> onInitData();
}

class HomeServiceImpl implements HomeService {
  final http.Client httpClient;

  HomeServiceImpl(this.httpClient);

  @override
  Future<bool> onInitData() async {
    try {
      final response = await httpClient.get(
        Uri.https("jsonplaceholder.typicode.com", "/todos/1"),
      );
      ExceptionHandling.handleAPIError(
        desireStatusCode: 200,
        response: response,
      );
      return true;
    } on AppException {
      rethrow;
    }
  }

  factory HomeServiceImpl.create() {
    return HomeServiceImpl(
      http.Client(),
    );
  }
}
