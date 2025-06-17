import 'dart:math';

import 'package:gulfnet_clean_arch_1/src/data/models/post_model.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/exceptions.dart';

abstract class PostRemoteDatasource{
  Future<List<PostModel>> getAllPosts();

  Future<PostModel> addPost(PostModel post);

  Future<PostModel> updatePostTitle(int id,String title);
}

class PostRemoteDatasourceImpl implements PostRemoteDatasource{

  final List<PostModel> _posts=[
    const PostModel(userId: 10, id: 1, title: "ABC", body: "abcd"),
    const PostModel(userId: 10, id: 2, title: "DEF", body: "efgh"),
    const PostModel(userId: 20, id: 3, title: "GHI", body: "ijkl"),
  ];

  @override
  Future<List<PostModel>> getAllPosts() async {
    await Future.delayed(const Duration(seconds: AppConstants.mockApiDelaySeconds));
    // Simulate a server error 10% of the time
    if (Random().nextDouble() < 0.1) {
      throw ServerException('Failed to fetch todos from server', statusCode: 500);
    }

    return List.from(_posts);
  }


  @override
  Future<PostModel> addPost(PostModel post) {
    // TODO: implement addPost
    throw UnimplementedError();
  }


  @override
  Future<PostModel> updatePostTitle(int id, String title) {
    // TODO: implement updatePostTitle
    throw UnimplementedError();
  }
  
}