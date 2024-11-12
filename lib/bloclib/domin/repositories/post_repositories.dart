import 'package:flutterblocstudey/bloclib/domin/entities/post_entity.dart';

abstract class PostRepo {
  Future<List<PostEnity>> getPostFromDataSources();
}