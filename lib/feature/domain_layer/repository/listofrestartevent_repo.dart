import 'package:qc_control_app/feature/domain_layer/entity/listofrestart_entity.dart';

abstract  class ListofrestarteventRepo {
Future<ListofRestartEventEntity> getRestartEvent(String token,int imfgpid,int activityid,  int orgid);
}   