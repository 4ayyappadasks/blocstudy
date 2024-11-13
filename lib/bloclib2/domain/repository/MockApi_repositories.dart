import '../enitities/MockApi_enitities.dart';

abstract class MockApiRepositories
{
  Future<List<MockApiEnities>> getMockApidataFromDataSiurce();
}