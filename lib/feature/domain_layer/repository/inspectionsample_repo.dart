import 'package:qc_control_app/feature/domain_layer/entity/inspectionsample_entity.dart';

abstract class InspectionsampleRepo{
  Future<InspectionSampleEntity> getSampleList(String token, int headerid, int activityid, int orgid, int processid, 
  int eventid, int imfgpid, int eventtriggerid,  int samplesize, int queeid, int queestatus);
}