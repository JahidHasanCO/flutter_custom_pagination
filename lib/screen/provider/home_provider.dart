import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:scroll_test/models/combine_model.dart';
import 'package:scroll_test/providers/repo.dart';
import 'package:scroll_test/repo/post_repo.dart';
import 'package:scroll_test/repo/product_repo.dart';
import 'package:scroll_test/screen/provider/home_state.dart';

class HomeProvider extends Notifier<HomeState> {
  late ProductRepo _productRepo;
  late PostRepo _postRepo;

  late ScrollController _scrollController;

  static const int _pageLimit = 10;

  @override
  HomeState build() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _productRepo = ref.read(productRepoProvider);
    _postRepo = ref.read(postRepoProvider);
    ref.onDispose(_dispose);
    return HomeState(status: HomeStatus.initial);
  }

  ScrollController get scrollController => _scrollController;

  Future<void> onInit() async {
    state = state.copyWith(status: HomeStatus.loading);
    await _fetchProduct();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      if (!state.isLoadingMore) {
        if (state.isProductPhase && state.hasMoreProducts) {
          _fetchProduct();
        } else if (!state.isProductPhase && state.hasMorePosts) {
          _fetchPost();
        }
      }
    }
  }

  Future<void> _fetchProduct() async {
    if (state.isLoadingMore || !state.hasMoreProducts) return;

    state = state.copyWith(isLoadingMore: true);

    try {
      final response = await _productRepo.getProducts(
        _pageLimit,
        state.productSkip,
      );

      if (response != null && response.products != null) {
        final updatedItems = List<CombineModel>.from(state.items)
          ..addAll(response.products!);

        state = state.copyWith(
          status: HomeStatus.success,
          items: updatedItems,
          productSkip: state.productSkip + response.products!.length,
          hasMoreProducts: response.hasMore,
          isLoadingMore: false,
        );

        if (!response.hasMore) {
          state = state.copyWith(isProductPhase: false);
          await _fetchPost();
        }
      } else {
        state = state.copyWith(
          status: HomeStatus.error,
          error: 'Failed to load products',
          isLoadingMore: false,
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: HomeStatus.error,
        error: e.toString(),
        isLoadingMore: false,
      );
    }
  }

  Future<void> _fetchPost() async {
    if (state.isLoadingMore || !state.hasMorePosts) return;

    state = state.copyWith(isLoadingMore: true);

    try {
      final response = await _postRepo.getPosts(_pageLimit, state.postSkip);

      if (response != null && response.posts != null) {
        final updatedItems = List<CombineModel>.from(state.items)
          ..addAll(response.posts!);

        state = state.copyWith(
          status: HomeStatus.success,
          items: updatedItems,
          postSkip: state.postSkip + response.posts!.length,
          hasMorePosts: response.hasMore,
          isLoadingMore: false,
        );
      } else {
        state = state.copyWith(
          status: HomeStatus.error,
          error: 'Failed to load posts',
          isLoadingMore: false,
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: HomeStatus.error,
        error: e.toString(),
        isLoadingMore: false,
      );
    }
  }

  void _dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
  }
}
