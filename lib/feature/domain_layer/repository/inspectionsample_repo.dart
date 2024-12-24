import 'package:qc_control_app/feature/domain_layer/entity/inspectionsample_entity.dart';

abstract class InspectionsampleRepo{
  Future<InspectionSampleEntity> getSampleList(String token, int headerId, int activityid);
}