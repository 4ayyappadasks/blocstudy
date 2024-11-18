import 'package:flutterblocstudey/bloclib4/data/try1_repositoryimpl/try1_repositoryimpl.dart';
import 'package:flutterblocstudey/bloclib4/domain/try1_entity/Try_Entity.dart';
import 'package:flutterblocstudey/bloclib4/domain/try1_repository/try1_Repository.dart';

class Try1UseCases{
  Try1Repository try1repository = Try1RepositoryImpl();
  Future<Try1Entity> GetDataFromDataSource()async{
    final data = try1repository.GetDataFromUsecase();
    return data;
  }
}