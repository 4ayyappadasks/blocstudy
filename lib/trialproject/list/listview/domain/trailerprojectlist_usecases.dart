import 'package:flutterblocstudey/trialproject/list/listview/data/trailerprojectlist_ripositoryimpl.dart';
import 'package:flutterblocstudey/trialproject/list/listview/domain/trailerprojectlist_repository.dart';
import 'package:flutterblocstudey/trialproject/list/listview/domain/trailerprojectlistentity.dart';

class TrailerprojectUsercase {
  TrailerprojectlistRepository trailerprojectlistRepository =
      TrailerProjectlistrepositoryimpl();

  Future<TrailerprojectEntity> functionfordatasources() async {
    final data = await trailerprojectlistRepository.functionforusecases();
    return data;
  }
}
