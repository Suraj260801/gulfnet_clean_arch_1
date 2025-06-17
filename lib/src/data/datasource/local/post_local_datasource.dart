import 'package:gulfnet_clean_arch_1/src/data/models/post_model.dart';

import '../../../../core/errors/exceptions.dart';

abstract class PostLocalDatasource {
  Future<List<PostModel>> getLastCachedTodos();
  Future<void> cacheTodos(List<PostModel> todos);
  Future<void> clearCache();
}

class PostLocalDatasourceImpl implements PostLocalDatasource{

  List<PostModel>? _cachedPosts;

  @override
  Future<List<PostModel>> getLastCachedTodos() async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate async read
    if (_cachedPosts != null) {
      return List.from(_cachedPosts!); // Return a copy
    } else {
      throw CacheException('No cached todos found.');
    }

  }

  @override
  Future<void> cacheTodos(List<PostModel> posts) async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate async write
    _cachedPosts = List.from(posts); // Store a copy
  }

  @override
  Future<void> clearCache() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _cachedPosts = null;
  }



}

