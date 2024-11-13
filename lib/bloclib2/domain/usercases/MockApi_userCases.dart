import 'package:flutterblocstudey/bloclib2/data/repository/MockApi_repository_impl.dart';
import 'package:flutterblocstudey/bloclib2/domain/enitities/MockApi_enitities.dart';
import 'package:flutterblocstudey/bloclib2/domain/repository/MockApi_repositories.dart';

class MockApilUseCases {
  MockApiRepositories mockApiRepositories = MockApiRepositoryImpl();

  Future<List<MockApiEnities>> GetPostFromDataSource() async {
    final MockApidata = mockApiRepositories.getMockApidataFromDataSource();
    return MockApidata;
  }
}
