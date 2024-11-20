import 'package:flutterblocstudey/blocpost2/data/datasource/getmethod_datasources.dart';
import 'package:flutterblocstudey/blocpost2/domain/entity/getmethod_entity.dart';
import 'package:flutterblocstudey/blocpost2/domain/repository/getmethod_repository.dart';

class Getmethodrepositoryimpl implements GetmethodRepository{
  GetmethodDataSource getmethodDataSource = GetmehodDataSourceImpl();
  @override
  Future<Getmethodentity> Getdatafromusecases() {
    final data = getmethodDataSource.GetipostApi();
    return data;
  }

}