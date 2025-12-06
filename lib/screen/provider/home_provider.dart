import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:scroll_test/providers/repo.dart';
import 'package:scroll_test/repo/post_repo.dart';
import 'package:scroll_test/repo/product_repo.dart';
import 'package:scroll_test/screen/provider/home_state.dart';

class HomeProvider extends Notifier<HomeState> {

  late ProductRepo _productRepo;
  late  PostRepo _postRepo;

  late ScrollController _scrollController;
  


  @override
  HomeState build() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _productRepo = ref.read(productRepoProvider);
    _postRepo = ref.read(postRepoProvider);
    ref.onDispose(_dispose);
    return HomeState(status: HomeStatus.initial);
  }

  Future<void> onInit() async {
    state = state.copyWith(status: HomeStatus.loading);
    
  }

  void _scrollListener(){

  }


  _fetchPost() async {
    
  }

  _fetchProduct() async {
    
  }

  void _dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
  }
}
