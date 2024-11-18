import 'package:flutterblocstudey/bloclib4/data/try1_datasource/try1_datasource.dart';
import 'package:flutterblocstudey/bloclib4/domain/try1_entity/Try_Entity.dart';
import 'package:flutterblocstudey/bloclib4/domain/try1_repository/try1_Repository.dart';

class Try1RepositoryImpl extends Try1Repository{
  Try1DataSource try1dataSource = Try1DataSourceimpl();

  @override
  Future<Try1Entity> GetDataFromUsecase() async{
    final data = await try1dataSource.FetchdatafromApi();
    return data;
  }
}