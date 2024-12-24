import 'package:qc_control_app/feature/data_layer/model/inspectionParameter_model.dart';
import 'package:qc_control_app/feature/data_layer/remote/inspectionparameter_datasource.dart';
import 'package:qc_control_app/feature/domain_layer/repository/inspectionparameter_repo.dart';

class InspectionparameterRepoImpl extends InspectionparameterRepo{

  final InspectionparameterDatasource inspectionparameterDatasource;

  InspectionparameterRepoImpl(this.inspectionparameterDatasource);

  @override
  Future<InspectionParameterModel> getParameterList(String token, int headerId,int activityId) {

  final inspecParam= inspectionparameterDatasource.getParameterList(token, headerId,activityId);

  return inspecParam;
    
  } 
  
}