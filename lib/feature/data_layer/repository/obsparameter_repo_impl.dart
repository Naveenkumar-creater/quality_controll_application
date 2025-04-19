import 'package:qc_control_app/feature/data_layer/remote/obsparameter_datasource.dart';
import 'package:qc_control_app/feature/domain_layer/entity/obsparameter_entity.dart';
import 'package:qc_control_app/feature/domain_layer/repository/obsparameter_repo.dart';

class ObsparameterRepoImpl extends ObsparameterRepo{

  final ObsparameterDatasource  obsparameterDatasource;

  ObsparameterRepoImpl(this.obsparameterDatasource);
  @override
  Future<ObsParameterEntity> getparameter(String token, int sampleId, int orgid,  int previousid) {
 
 final result = obsparameterDatasource.getParaneter(token, sampleId, orgid,   previousid);

 return result;
  
  }
  
}