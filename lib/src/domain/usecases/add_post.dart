import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../entities/post_entity.dart';
import '../repositories/post_repository.dart';

class AddPost{
  final PostRepository repository;

  AddPost(this.repository);

  /// Executes the use case.
  /// Returns an [Either] with a [Failure] on the left or a list of [PostEntity] on the right.
  Future<Either<Failure,PostEntity>> call(PostEntity post) async {
    return await repository.addPost(post);
  }
}