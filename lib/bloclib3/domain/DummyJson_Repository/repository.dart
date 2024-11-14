import 'package:flutterblocstudey/bloclib3/domain/DummyJson_Entity/enitity.dart';

abstract class DummyJsonRepository {
  Future<List<DatumEntity>> GetdatafromDatasource();
}
