import 'package:qc_control_app/feature/domain_layer/entity/inspectionsample_entity.dart';
import 'package:qc_control_app/feature/domain_layer/repository/inspectionsample_repo.dart';

class InspectionsampleUsecase {
  final InspectionsampleRepo  inspectionsampleRepo;
  InspectionsampleUsecase(this.inspectionsampleRepo);

  Future<InspectionSampleEntity>getSampleList(String token, int headerId, int activityid){
    return inspectionsampleRepo.getSampleList(token, headerId, activityid);
    
  }
}