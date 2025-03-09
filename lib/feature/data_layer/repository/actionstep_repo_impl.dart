import 'package:qc_control_app/feature/data_layer/remote/actionstep_datasource.dart';
import 'package:qc_control_app/feature/domain_layer/entity/actionstep_entity.dart';
import 'package:qc_control_app/feature/domain_layer/repository/actionstep_repo.dart';

class ActionstepRepoImpl extends ActionstepRepo {

final ActionstepDatasource actionstepDatasource;

ActionstepRepoImpl(this.actionstepDatasource);
  @override
  Future<ActionStepEntity> getAction(String token, String clgroup, int orgid) {
 
  final result= actionstepDatasource.getAction(token, clgroup, orgid);

  return result;

  }
  
}