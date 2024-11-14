import 'package:flutterblocstudey/bloclib3/data/DummyJson_Datasource/datasource.dart';
import 'package:flutterblocstudey/bloclib3/domain/DummyJson_Entity/enitity.dart';
import 'package:flutterblocstudey/bloclib3/domain/DummyJson_Repository/repository.dart';

class DummyJsonRepositoryImpl implements DummyJsonRepository {
  final DummyJsonDataSource dummyJsonDataSource = DummyJsonDataSourceImpl();

  @override
  Future<List<DatumEntity>> GetdatafromDatasource() async {
    final dummyJsonEntity = await dummyJsonDataSource.getDataFromApi();
    return dummyJsonEntity.data;
  }
}
