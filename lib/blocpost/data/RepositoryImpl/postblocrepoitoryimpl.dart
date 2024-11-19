import 'package:flutterblocstudey/blocpost/data/DataSource/postblocdatasource.dart';
import 'package:flutterblocstudey/blocpost/domain/Entity/postblocentity.dart';
import 'package:flutterblocstudey/blocpost/domain/Repository/postblocrepository.dart';

class PostblocRepositoryImpl implements PostblocRepository{
  PostblocDataSource postblocDataSource = PosrblocDataSourceimpl();

  @override
  Future<PostblocEntity> getdatafromusecases1({required int id}) {
    print("Repository called with id: $id");
    final data = postblocDataSource.fetchdatafromApi(id: id);
    return data;
  }

}