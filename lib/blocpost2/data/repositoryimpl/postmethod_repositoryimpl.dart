import 'package:flutterblocstudey/blocpost2/data/datasource/postmethod_datasources.dart';
import 'package:flutterblocstudey/blocpost2/domain/entity/postmethod_entity.dart';
import 'package:flutterblocstudey/blocpost2/domain/repository/postmethod_repository.dart';

class PostmethoodRepositoryImpl extends PostmethodRepository{
  Postmethoddatasource postmethoddatasource = Postmethoddatasouceimpl();

  @override
  Future<Postmethodentity> getdatadeimdatasource({required String tittle}) {
    final data = postmethoddatasource.fethcdataromApi(tittle: tittle);
    return data;
  }


}