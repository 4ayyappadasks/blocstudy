import '../try1_entity/Try_Entity.dart';

abstract class Try1Repository{
  Future<Try1Entity> GetDataFromUsecase();
}