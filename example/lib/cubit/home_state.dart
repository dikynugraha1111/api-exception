part of 'home_cubit.dart';

enum HomeStateStatus { initial, loading, success, failure }

extension HomeStateStatusExt on HomeStateStatus {
  bool get isInitial => this == HomeStateStatus.initial;
  bool get isLoading => this == HomeStateStatus.loading;
  bool get isSuccess => this == HomeStateStatus.success;
  bool get isFailure => this == HomeStateStatus.failure;
}

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStateStatus.initial,
    this.exception,
  });

  final HomeStateStatus status;
  final AppException? exception;

  HomeState copyWith({
    HomeStateStatus? status,
    AppException? exception,
  }) {
    return HomeState(
      status: status ?? this.status,
      exception: exception ?? this.exception,
    );
  }

  @override
  List<Object?> get props => [
        status,
        exception,
      ];
}
