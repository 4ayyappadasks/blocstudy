import 'package:flutterblocstudey/bloclib3/data/DummyJson_RepositoryIMPL/DummyJsonRepository.dart';
import 'package:flutterblocstudey/bloclib3/domain/DummyJson_Entity/enitity.dart';
import 'package:flutterblocstudey/bloclib3/domain/DummyJson_Repository/repository.dart';

class DummyApiUsecases
{
  DummyJsonRepository dummyJsonRepository = DummyJsonRepositoryImpl();

  Future<List<DatumEntity>> GetTriggerDataSource()
  {
    final data = dummyJsonRepository.GetdatafromDatasource();
    return data;
  }
}