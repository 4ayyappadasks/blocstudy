import 'package:flutterblocstudey/trialproject/list/listview/data/trailerprojectlist_datasource.dart';
import 'package:flutterblocstudey/trialproject/list/listview/domain/trailerprojectlist_repository.dart';

import '../domain/trailerprojectlistentity.dart';

class TrailerProjectlistrepositoryimpl implements TrailerprojectlistRepository{
  TrailerprojectlistDatasource trailerprojectlistDatasource = TrailerprojectlistDatasourceimpl();
  @override
  Future<TrailerprojectEntity> functionforusecases() {
    final data = trailerprojectlistDatasource.functionforApi();
    return data;
  }
}