import 'package:flutterblocstudey/blocpost/data/RepositoryImpl/postblocrepoitoryimpl.dart';
import 'package:flutterblocstudey/blocpost/domain/Entity/postblocentity.dart';
import 'package:flutterblocstudey/blocpost/domain/Repository/postblocrepository.dart';

class PostblocUseCases {
  final int id;
  PostblocUseCases({required this.id});
  final PostblocRepository postblocRepository = PostblocRepositoryImpl();

  Future<PostblocEntity> getdatafromDatasource() async {
    print("UseCase called with id: $id");
    final data = await postblocRepository.getdatafromusecases1(id: id);
    return data;
  }
}
