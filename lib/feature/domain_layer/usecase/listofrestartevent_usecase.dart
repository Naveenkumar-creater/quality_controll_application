import 'package:qc_control_app/feature/domain_layer/entity/listofrestart_entity.dart';

import 'package:qc_control_app/feature/domain_layer/repository/listofrestartevent_repo.dart';

class ListofrestarteventUsecase {

final ListofrestarteventRepo listofrestarteventRepo;

  ListofrestarteventUsecase(this.listofrestarteventRepo);


  Future<ListofRestartEventEntity> getRestartEvent(String token,int imfgpid, int activityid, int orgid){

return listofrestarteventRepo.getRestartEvent(token, imfgpid, activityid, orgid);
  }


}