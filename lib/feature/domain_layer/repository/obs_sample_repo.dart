import 'package:qc_control_app/feature/domain_layer/entity/obs_sample_entity.dart';

abstract class ObsSampleRepo{
  Future<ObsSampleEntity> getSample( String token, int inspectionId, int orgid);
}