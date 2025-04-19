import 'package:qc_control_app/feature/data_layer/remote/inspectionsample_datasource.dart';
import 'package:qc_control_app/feature/domain_layer/entity/inspectionsample_entity.dart';
import 'package:qc_control_app/feature/domain_layer/repository/inspectionsample_repo.dart';

class InspectionsampleRepoImpl extends InspectionsampleRepo{

  final InspectionSampleDatasource inspectionSampleDatasource;
  InspectionsampleRepoImpl(this.inspectionSampleDatasource);
  
  @override
  Future<InspectionSampleEntity> getSampleList(String token, int headerid, int activityid, int orgid, int processid, 
  int eventid, int imfgpid, int eventtriggerid,  int samplesize, int queeid, int queestatus,int samplesetheaderid,double productionqty, int samplesetstatus, int samplesetindex) {
    
    final result= inspectionSampleDatasource.getSampleList( token,  headerid,  activityid,  orgid,  processid, 
   eventid,  imfgpid,  eventtriggerid,   samplesize,  queeid,  queestatus , samplesetheaderid, productionqty,  samplesetstatus, samplesetindex);
    return result;
  }

}