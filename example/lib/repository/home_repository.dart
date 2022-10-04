import 'package:api_exception/exception.dart';

import '../service/home_service.dart';

abstract class HomeRepository {
  Future<bool> onInitData();
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeService homeService;

  HomeRepositoryImpl(this.homeService);

  @override
  Future<bool> onInitData() async {
    try {
      return await homeService.onInitData();
    } on AppException {
      rethrow;
    } catch (e) {
      throw UnknownException(
        message: e.toString(),
      );
    }
  }

  factory HomeRepositoryImpl.create() {
    return HomeRepositoryImpl(
      HomeServiceImpl.create(),
    );
  }
}
