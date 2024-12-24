import 'package:qc_control_app/feature/domain_layer/entity/obs_sample_entity.dart';
import 'package:qc_control_app/feature/domain_layer/entity/obsparameter_entity.dart';

abstract class ObsparameterRepo{
  Future<ObsParameterEntity> getparameter( String token, int sampleId);
}