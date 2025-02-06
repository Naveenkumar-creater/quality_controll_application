import 'package:qc_control_app/feature/domain_layer/entity/obs_sample_entity.dart';
import 'package:qc_control_app/feature/domain_layer/repository/obs_sample_repo.dart';

class ObsSampleUsecase {
  final ObsSampleRepo  obsSampleRepo;
  ObsSampleUsecase(this.obsSampleRepo);

  Future<ObsSampleEntity>getSample(String token, int inspectionId, int orgid){

    return obsSampleRepo.getSample(token, inspectionId, orgid);
    
  }
  
}