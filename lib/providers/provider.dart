import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scroll_test/screen/provider/home_provider.dart';
import 'package:scroll_test/screen/provider/home_state.dart';

final homeProvider = NotifierProvider<HomeProvider, HomeState>(
  () => HomeProvider(),
  isAutoDispose: true,
);
