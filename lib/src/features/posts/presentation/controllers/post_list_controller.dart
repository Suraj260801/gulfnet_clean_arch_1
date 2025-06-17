import 'dart:async';

import 'package:gulfnet_clean_arch_1/src/domain/entities/post_entity.dart';
import 'package:gulfnet_clean_arch_1/src/domain/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'post_list_controller.g.dart';

@Riverpod(keepAlive: true)
class PostListController extends _$PostListController{

  final Uuid _uuid=const Uuid();

  @override
  FutureOr<List<PostEntity>> build() async{

    return _fetchPosts();

  }

  Future<List<PostEntity>> _fetchPosts() async{
      final getAllPosts=ref.read(getAllPostsUseCaseProvider);
      final result=await getAllPosts();

      return result.fold(
              (failure){
        // Handle error, e.g., show a snackbar or log
        print('Error fetching todos: ${failure.message}');

        throw Exception(failure.message); // Throwing an exception puts state in AsyncError
      },
          (posts)=>posts
      );
  }
}