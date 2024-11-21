import 'package:flutterblocstudey/blocpost2/domain/entity/postmethod_entity.dart';

abstract class PostmethodRepository {
  Future<Postmethodentity> getdatadeimdatasource({required String tittle});
}