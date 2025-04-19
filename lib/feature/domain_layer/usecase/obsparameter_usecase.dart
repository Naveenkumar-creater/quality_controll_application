import 'package:qc_control_app/feature/data_layer/model/obsParameter_model.dart';
import 'package:qc_control_app/feature/domain_layer/entity/obsparameter_entity.dart';
import 'package:qc_control_app/feature/domain_layer/repository/obsparameter_repo.dart';

class ObsparameterUsecase  {
  final ObsparameterRepo obsparameterRepo;
  ObsparameterUsecase(this.obsparameterRepo);
  Future<ObsParameterEntity> getparameter(String token, int sampleId, int orgid,  int previousid){

    return obsparameterRepo.getparameter(token, sampleId, orgid,  previousid);
    
  }
  
}