import 'package:dartz/dartz.dart';
import 'package:gulfnet_clean_arch_1/core/errors/exceptions.dart';
import 'package:gulfnet_clean_arch_1/core/errors/failures.dart';
import 'package:gulfnet_clean_arch_1/core/network/network_info.dart';
import 'package:gulfnet_clean_arch_1/src/data/datasource/local/post_local_datasource.dart';
import 'package:gulfnet_clean_arch_1/src/data/datasource/remote/post_remote_datasource.dart';
import 'package:gulfnet_clean_arch_1/src/domain/entities/post_entity.dart';
import 'package:gulfnet_clean_arch_1/src/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDatasource remoteDatasource;
  final PostLocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl(
      {required this.remoteDatasource,
      required this.localDatasource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<PostEntity>>> getAllPosts() async {
    if (await networkInfo.isConnected()) {
      try {
        final remotePosts = await remoteDatasource.getAllPosts();
        await localDatasource.cacheTodos(remotePosts); //cache remote posts
        return Right(remotePosts.map((model) => model.toEntity()).toList());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } on ClientException catch (e) {
        return Left(ClientFailure(e.message));
      } catch (e) {
        return Left(
            UnexpectedFailure("An unexpected error occurred:${e.toString()}"));
      }
    } else {
      try {
        final localPosts = await localDatasource.getLastCachedTodos();
        return Right(localPosts.map((model) => model.toEntity()).toList());
      } on CacheException catch (e) {
        return Left(CacheFailure(e.message));
      } on NetworkException catch (e) {
        return Left(NetworkFailure(e.message));
      } catch (e) {
        return Left(UnexpectedFailure(
            "An unexpected error occurred while fetching cached data:${e.toString()}"));
      }
    }
  }

  @override
  Future<Either<Failure, PostEntity>> addPost(PostEntity post) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, PostEntity>> updatePostTitle(int id, String title) {
    // TODO: implement updatePostTitle
    throw UnimplementedError();
  }
}
