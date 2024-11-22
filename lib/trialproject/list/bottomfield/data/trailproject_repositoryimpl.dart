import 'package:flutterblocstudey/trialproject/list/bottomfield/data/trailproject_datasource.dart';
import 'package:flutterblocstudey/trialproject/list/bottomfield/domain/trailproject_entity.dart';
import 'package:flutterblocstudey/trialproject/list/bottomfield/domain/trailproject_repository.dart';

class TrialprojectRepositoryimpl extends Trialprojectrepository{
  Trialprojectdatasource trialprojectdatasource = Trialprojectdatasourceimpl();

  @override
  Future<Trialprojectentity> functionforusecases({required String message}) async{
    final data = trialprojectdatasource.functionforapicall(message:message);
    return data;
  }

}