import 'package:qc_control_app/feature/domain_layer/entity/inspectionparameter_entity.dart';

abstract class InspectionparameterRepo{
  Future<InspectionParameterEntity> getParameterList( String token, int headerId,int activityId, int orgid);
}