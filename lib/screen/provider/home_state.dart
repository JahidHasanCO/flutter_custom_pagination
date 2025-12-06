import 'package:equatable/equatable.dart';
import 'package:scroll_test/models/combine_model.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  error;

  bool get isInitial => this == HomeStatus.initial;
  bool get isLoading => this == HomeStatus.loading;
  bool get isSuccess => this == HomeStatus.success;
  bool get isError => this == HomeStatus.error;
}

class HomeState extends Equatable {
  final HomeStatus status;
  final String? error;
  final List<CombineModel> items;

  const HomeState({required this.status, this.error, this.items = const []});

  HomeState copyWith({
    HomeStatus? status,
    String? error,
    List<CombineModel>? items,
  }) {
    return HomeState(
      status: status ?? this.status,
      error: error ?? this.error,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [status, error, items];
}
