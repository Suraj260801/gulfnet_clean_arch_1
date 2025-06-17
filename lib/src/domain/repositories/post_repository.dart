import 'package:dartz/dartz.dart';
import 'package:gulfnet_clean_arch_1/core/errors/failures.dart';
import 'package:gulfnet_clean_arch_1/src/domain/entities/post_entity.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostEntity>>> getAllPosts();

  Future<Either<Failure, PostEntity>> addPost(PostEntity post);

  Future<Either<Failure,PostEntity>> updatePostTitle(int id,String title);

}
