import 'package:qc_control_app/feature/data_layer/remote/inspectionsample_datasource.dart';
import 'package:qc_control_app/feature/domain_layer/entity/inspectionsample_entity.dart';
import 'package:qc_control_app/feature/domain_layer/repository/inspectionsample_repo.dart';

class InspectionsampleRepoImpl extends InspectionsampleRepo{

  final InspectionSampleDatasource inspectionSampleDatasource;
  InspectionsampleRepoImpl(this.inspectionSampleDatasource);
  
  @override
  Future<InspectionSampleEntity> getSampleList(String token, int headerid, int activityid) {
    
    final result= inspectionSampleDatasource.getSampleList(token, headerid, activityid);
    return result;
  }

}