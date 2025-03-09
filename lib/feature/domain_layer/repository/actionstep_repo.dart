import 'package:qc_control_app/feature/domain_layer/entity/actionstep_entity.dart';

abstract  class ActionstepRepo {
Future<ActionStepEntity> getAction(String token,String clgroup,  int orgid);
}   