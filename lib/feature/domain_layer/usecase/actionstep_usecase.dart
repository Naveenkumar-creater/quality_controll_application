import 'package:qc_control_app/feature/domain_layer/entity/actionstep_entity.dart';
import 'package:qc_control_app/feature/domain_layer/repository/actionstep_repo.dart';

class ActionstepUsecase {

final ActionstepRepo actionstepRepo;

  ActionstepUsecase(this.actionstepRepo);


  Future<ActionStepEntity> getActionList(String token,String clgroup, int orgid){

return actionstepRepo.getAction( token, clgroup, orgid );
  }


}