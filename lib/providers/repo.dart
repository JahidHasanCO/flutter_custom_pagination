import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scroll_test/repo/post_repo.dart';
import 'package:scroll_test/repo/product_repo.dart';

final postRepoProvider = Provider<PostRepo>((ref) => PostRepo());

final productRepoProvider = Provider<ProductRepo>((ref) => ProductRepo());