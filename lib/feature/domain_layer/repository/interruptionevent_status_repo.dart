import 'package:qc_control_app/feature/domain_layer/entity/interruptionevent_status_entity.dart';
abstract class InterruptioneventStatusRepo{

  Future<ListInterruptionEventEntity> getinterruptionStatus(String token, int orgid,int activityid, int imfgpid );
}