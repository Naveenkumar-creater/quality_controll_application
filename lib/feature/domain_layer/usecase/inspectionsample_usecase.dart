import 'package:qc_control_app/feature/domain_layer/entity/inspectionsample_entity.dart';
import 'package:qc_control_app/feature/domain_layer/repository/inspectionsample_repo.dart';

class InspectionsampleUsecase {
  final InspectionsampleRepo  inspectionsampleRepo;
  InspectionsampleUsecase(this.inspectionsampleRepo);

  Future<InspectionSampleEntity>getSampleList(String token, int headerid, int activityid, int orgid, int processid, 
  int eventid, int imfgpid, int eventtriggerid,  int samplesize, int queeid, int queestatus){
    return inspectionsampleRepo.getSampleList( token,  headerid,  activityid,  orgid,  processid, 
   eventid,  imfgpid,  eventtriggerid,   samplesize,  queeid,  queestatus);
    
  }
}