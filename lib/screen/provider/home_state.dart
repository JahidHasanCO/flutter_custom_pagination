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
  final int productSkip;
  final int postSkip;
  final bool isLoadingMore;
  final bool hasMoreProducts;
  final bool hasMorePosts;
  final bool isProductPhase;

  const HomeState({
    required this.status,
    this.error,
    this.items = const [],
    this.productSkip = 0,
    this.postSkip = 0,
    this.isLoadingMore = false,
    this.hasMoreProducts = true,
    this.hasMorePosts = true,
    this.isProductPhase = true,
  });

  HomeState copyWith({
    HomeStatus? status,
    String? error,
    List<CombineModel>? items,
    int? productSkip,
    int? postSkip,
    bool? isLoadingMore,
    bool? hasMoreProducts,
    bool? hasMorePosts,
    bool? isProductPhase,
  }) {
    return HomeState(
      status: status ?? this.status,
      error: error ?? this.error,
      items: items ?? this.items,
      productSkip: productSkip ?? this.productSkip,
      postSkip: postSkip ?? this.postSkip,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMoreProducts: hasMoreProducts ?? this.hasMoreProducts,
      hasMorePosts: hasMorePosts ?? this.hasMorePosts,
      isProductPhase: isProductPhase ?? this.isProductPhase,
    );
  }

  @override
  List<Object?> get props => [
    status,
    error,
    items,
    productSkip,
    postSkip,
    isLoadingMore,
    hasMoreProducts,
    hasMorePosts,
    isProductPhase,
  ];
}
