import 'package:gulfnet_clean_arch_1/core/network/network_info.dart';
import 'package:gulfnet_clean_arch_1/src/data/datasource/providers.dart';
import 'package:gulfnet_clean_arch_1/src/data/repositories/post_repository_impl.dart';
import 'package:gulfnet_clean_arch_1/src/domain/repositories/post_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
NetworkInfo networkInfo(NetworkInfoRef ref){
  return NetworkInfoImpl();
}

@Riverpod(keepAlive: true)
PostRepository postRepository(PostRepositoryRef ref){

  return PostRepositoryImpl(remoteDatasource: ref.watch(postRemoteDatasourceProvider), localDatasource: ref.watch(postLocalDatasourceProvider), networkInfo: ref.watch(networkInfoProvider));
}