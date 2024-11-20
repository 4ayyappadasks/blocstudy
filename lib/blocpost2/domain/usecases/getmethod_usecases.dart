import 'package:flutterblocstudey/blocpost2/data/repositoryimpl/getmethod_repositoryimpl.dart';
import 'package:flutterblocstudey/blocpost2/domain/entity/getmethod_entity.dart';
import 'package:flutterblocstudey/blocpost2/domain/repository/getmethod_repository.dart';

class Getmethodusecases {
  GetmethodRepository getmethodRepository = Getmethodrepositoryimpl();
  Future<Getmethodentity> Getdatafromdatasource()async{
    final data = getmethodRepository.Getdatafromusecases();
    return data;
}
}