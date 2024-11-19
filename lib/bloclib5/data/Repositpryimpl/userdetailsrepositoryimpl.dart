import 'package:flutterblocstudey/bloclib5/data/DataSource/userdetailsdatasource.dart';
import 'package:flutterblocstudey/bloclib5/domain/Enitity/userdetailsentity.dart';
import 'package:flutterblocstudey/bloclib5/domain/Repository/userdetailsrepository.dart';

class UserdetailsRepositoryImpl implements UserdetailsRepository{
  UserDetailsDataSource userDetailsDataSource = UserDetailsDataSourceImpl();
  @override
  Future<Userdetailsentity> fetchdatafromusercase() {
   final data = userDetailsDataSource.FetchdatafromApi();
    return data;
  }
}