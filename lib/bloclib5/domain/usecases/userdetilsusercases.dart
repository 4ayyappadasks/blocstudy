import 'package:flutterblocstudey/bloclib5/data/Repositpryimpl/userdetailsrepositoryimpl.dart';
import 'package:flutterblocstudey/bloclib5/domain/Enitity/userdetailsentity.dart';
import 'package:flutterblocstudey/bloclib5/domain/Repository/userdetailsrepository.dart';

class UserDetailsUseCases{
  UserdetailsRepository userdetailsRepository = UserdetailsRepositoryImpl();
  Future<Userdetailsentity> GetdatafromDatasource()async{
    final data = userdetailsRepository.fetchdatafromusercase();
    return data;
  }
}