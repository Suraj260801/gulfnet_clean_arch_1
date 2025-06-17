import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gulfnet_clean_arch_1/core/network/dio_client.dart';
import 'package:gulfnet_clean_arch_1/src/data/datasource/local/post_local_datasource.dart';
import 'package:gulfnet_clean_arch_1/src/data/datasource/remote/post_remote_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';


@Riverpod(keepAlive: true)
DioClient dioClient(Ref ref){
  return DioClient();
}

@Riverpod(keepAlive: true)
PostRemoteDatasource postRemoteDatasource(Ref ref){
  return PostRemoteDatasourceImpl(dio: ref.watch(dioClientProvider).instance);
}


@Riverpod(keepAlive: true)
PostLocalDatasource postLocalDatasource(Ref ref){
  return PostLocalDatasourceImpl();
}