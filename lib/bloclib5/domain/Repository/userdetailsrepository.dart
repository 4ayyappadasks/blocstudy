import 'package:flutterblocstudey/bloclib5/domain/Enitity/userdetailsentity.dart';

abstract class UserdetailsRepository{
  Future<Userdetailsentity> fetchdatafromusercase();
}