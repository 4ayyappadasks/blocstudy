import 'package:flutterblocstudey/blocpost2/data/repositoryimpl/postmethod_repositoryimpl.dart';
import 'package:flutterblocstudey/blocpost2/domain/repository/postmethod_repository.dart';

import '../entity/postmethod_entity.dart';

class PostmethodUsecases {
  PostmethodUsecases({required this.tittle});
  final String tittle;
  PostmethodRepository postmethodRepository = PostmethoodRepositoryImpl();
  Future<Postmethodentity> getdatafromdatasource() async{
    final data = postmethodRepository.getdatadeimdatasource(tittle: tittle);
    return data;
}
}