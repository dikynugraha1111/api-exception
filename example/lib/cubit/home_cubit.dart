import 'package:api_exception/exception.dart';
import 'package:api_exception_example/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  final HomeRepository homeRepository = HomeRepositoryImpl.create();

  Future<void> onInitData() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      await homeRepository.onInitData();
      emit(state.copyWith(status: HomeStateStatus.success));
    } on AppException catch (e) {
      emit(state.copyWith(
        status: HomeStateStatus.failure,
        exception: e,
      ));
    }
  }
}
