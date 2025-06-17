import 'package:dartz/dartz.dart';
import 'package:gulfnet_clean_arch_1/core/errors/failures.dart';
import 'package:gulfnet_clean_arch_1/src/domain/entities/post_entity.dart';
import 'package:gulfnet_clean_arch_1/src/domain/repositories/post_repository.dart';

/// Use case for retrieving all Post items.
/// Encapsulates the business logic for this specific operation.
class GetAllPosts{
  final PostRepository repository;

  GetAllPosts(this.repository);

  /// Executes the use case.
  /// Returns an [Either] with a [Failure] on the left or a list of [PostEntity] on the right.
  Future<Either<Failure,List<PostEntity>>> call() async {
    return await repository.getAllPosts();
  }
}