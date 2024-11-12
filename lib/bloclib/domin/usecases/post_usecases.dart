import 'package:flutterblocstudey/bloclib/data/repositories/post_repo_impl.dart';
import 'package:flutterblocstudey/bloclib/domin/entities/post_entity.dart';
import 'package:flutterblocstudey/bloclib/domin/repositories/post_repositories.dart';

class PostUseCases {
  PostRepo postRepo = PostRepoImpl();
  Future<List<PostEnity>> GetPOstFromDataSources() async {
   final post = await postRepo.getPostFromDataSources();
   return post;
  }
}
