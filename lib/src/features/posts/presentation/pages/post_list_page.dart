import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gulfnet_clean_arch_1/src/features/posts/presentation/controllers/post_list_controller.dart';

class PostListPage extends ConsumerWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final postListAsyncValue=ref.watch(postListControllerProvider);
    return Scaffold(
      appBar: AppBar(title: Text("My Posts"),actions: [
        IconButton(onPressed: (){
          ref.invalidate(postListControllerProvider);
        }, icon: Icon(Icons.refresh))
      ],),
      body: postListAsyncValue.when(
          data: (posts){
            if(posts.isEmpty) return const Center(child: Text("No Posts Yet! Add One Below"));
            return ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: posts.length,
                itemBuilder: (context,index){
                    return ListTile(
                      leading: Text(posts[index].id.toString()),
                      title: Text(posts[index].title),
                      trailing: Text(posts[index].body),
                    );
                });

          },
          error: (error, stack)=> Center(child: Text(error.toString()),),
          loading: ()=>CircularProgressIndicator()),
    );
  }
}
