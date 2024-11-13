import 'package:flutterblocstudey/bloclib2/data/datasource/MockupApi_datasource.dart';
import 'package:flutterblocstudey/bloclib2/domain/enitities/MockApi_enitities.dart';
import 'package:flutterblocstudey/bloclib2/domain/repository/MockApi_repositories.dart';

class MockApiRepositoryImpl implements MockApiRepositories
{
  MockupApiDatasource mockupApiDatasource = MockupApiDatSourceimpl();

  @override
  Future<List<MockApiEnities>> getMockApidataFromDataSource() async{
    final post = mockupApiDatasource.GetdatafromAPi();
    return post;
  }
}