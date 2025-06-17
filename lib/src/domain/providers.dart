import 'package:gulfnet_clean_arch_1/src/data/repositories/providers.dart';
import 'package:gulfnet_clean_arch_1/src/domain/usecases/add_post.dart';
import 'package:gulfnet_clean_arch_1/src/domain/usecases/get_all_posts.dart';
import 'package:gulfnet_clean_arch_1/src/domain/usecases/update_post_title.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
GetAllPosts getAllPostsUseCase(GetAllPostsUseCaseRef ref){
  return GetAllPosts(ref.watch(postRepositoryProvider));
}

@Riverpod(keepAlive: true)
AddPost addPostUseCase(AddPostUseCaseRef ref){
  return AddPost(ref.watch(postRepositoryProvider));
}

@Riverpod(keepAlive: true)
UpdatePostTitle updatePostTitleUseCase(UpdatePostTitleUseCaseRef ref){
  return UpdatePostTitle(ref.watch(postRepositoryProvider));
}
