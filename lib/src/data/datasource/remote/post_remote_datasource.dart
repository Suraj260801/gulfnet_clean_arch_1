import 'dart:math';

import 'package:dio/dio.dart';
import 'package:gulfnet_clean_arch_1/src/data/models/post_model.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/exceptions.dart';

abstract class PostRemoteDatasource{
  Future<List<PostModel>> getAllPosts();

  Future<PostModel> addPost(PostModel post);

  Future<PostModel> updatePostTitle(int id,String title);
}

class PostRemoteDatasourceImpl implements PostRemoteDatasource{

  final Dio dio; // Dependency injection for Dio client

  // Constructor to inject the Dio client
  const PostRemoteDatasourceImpl({required this.dio});

  @override
  Future<List<PostModel>> getAllPosts() async {
    // Dio automatically handles base URL if configured, but you can also build it here
    final String url = '${AppConstants.baseUrl}/posts';

    try{
      final Response response=await dio.get(
          url,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            }
          )
      );

      // Dio's response.data is already decoded if the Content-Type is 'application/json'
      // and Dio's default Transformers are used (which is usually the case).
      if(response.statusCode==200){
        if(response.data is List){
          final List<dynamic> jsonList=response.data;
          // Map each item in the list to a PostModel using its fromJson factory
          return jsonList.map((json)=>PostModel.fromJson(json as Map<String,dynamic>)).toList();
        }else{
          throw DataParsingException("'Unexpected data format from API: Expected a list.'");
        }
      }else{
        // Dio often wraps non-2xx responses in DioException, but for explicit checks
        // or if you disable validateStatus, you might check statusCode directly.
        // However, usually, Dio will throw a DioException for non-2xx status codes
        // unless 'validateStatus' is customized.
        throw ServerException('Failed to fetch posts: ${response.statusMessage}',statusCode: response.statusCode ?? 500);
      }
    } on DioException catch (e) {
      // DioException catches all HTTP errors, network errors, and parsing errors from Dio
      if (e.type == DioExceptionType.connectionError || e.type == DioExceptionType.unknown) {
        // This includes SocketException (no internet) and other network issues
        throw NetworkException('No Internet connection or host unreachable. Please check your network.');
      } else if (e.type == DioExceptionType.badResponse) {
        // Server responded with a non-2xx status code
        final statusCode = e.response?.statusCode;
        final errorMessage = e.response?.statusMessage ?? 'Unknown server error';
        if (statusCode != null && statusCode >= 400 && statusCode < 500) {
          throw ServerException(
            'Client Error: $statusCode - $errorMessage',
            statusCode: statusCode,
            // You can also pass e.response?.data if the server sends error details
          );
        } else if (statusCode != null && statusCode >= 500) {
          throw ServerException(
            'Server Error: $statusCode - $errorMessage',
            statusCode: statusCode,
          );
        } else {
          // Fallback for other bad response types
          throw ServerException(
            'Unexpected HTTP error: $statusCode - $errorMessage',
            statusCode: statusCode ?? 500,
          );
        }
      } else if (e.type == DioExceptionType.badCertificate) {
        throw ServerException('SSL Certificate error.', statusCode: 0); // Or a specific code
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw NetworkException('Connection timeout. Please try again.');
      } else if (e.type == DioExceptionType.cancel) {
        throw NetworkException('Request cancelled.');
      } else {
        // Catch any other unexpected Dio errors
        throw UnknownException('An unexpected Dio error occurred: ${e.message}');
      }
    } catch (e) {
      // Catch any other non-Dio related errors
      throw UnknownException('An unknown error occurred: ${e.toString()}');
    }
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