import 'package:qc_control_app/feature/domain_layer/entity/inspectionparameter_entity.dart';
import 'package:qc_control_app/feature/domain_layer/repository/inspectionparameter_repo.dart';

class InspectionparameterUsecase {

  final InspectionparameterRepo  inspectionparameterRepo;

  InspectionparameterUsecase(
     this.inspectionparameterRepo
  );

  Future<InspectionParameterEntity> getParameterList(String token,int headerId, int activityId){  
    return inspectionparameterRepo.getParameterList(token, headerId,activityId);
  }
  
}