import 'package:flutterblocstudey/trialproject/list/bottomfield/data/trailproject_repositoryimpl.dart';
import 'package:flutterblocstudey/trialproject/list/bottomfield/domain/trailproject_entity.dart';
import 'package:flutterblocstudey/trialproject/list/bottomfield/domain/trailproject_repository.dart';

class TrialProjectUsecases{
 final Trialprojectrepository trialprojectrepository = TrialprojectRepositoryimpl();
 Future<Trialprojectentity> functionfordatasource({required String message})
 async{
  final data = trialprojectrepository.functionforusecases(message :message);
  return data;
 }
}