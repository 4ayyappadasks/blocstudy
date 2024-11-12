import 'package:flutterblocstudey/bloclib/data/datasource/post_remote_datasource.dart';
import 'package:flutterblocstudey/bloclib/domin/entities/post_entity.dart';
import 'package:flutterblocstudey/bloclib/domin/repositories/post_repositories.dart';

class PostRepoImpl implements PostRepo {
  PostRemoteDataSource postRemoteDataSource = PostRemoteDataSourceimpl();

  @override
  Future<List<PostEnity>> getPostFromDataSources() async {
    final post = await postRemoteDataSource.getPostFromApi();
    return post;
  }
}
