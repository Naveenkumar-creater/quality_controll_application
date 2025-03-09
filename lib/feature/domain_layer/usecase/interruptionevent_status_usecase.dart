import 'package:qc_control_app/feature/domain_layer/entity/interruptionevent_status_entity.dart';
import 'package:qc_control_app/feature/domain_layer/repository/interruptionevent_status_repo.dart';


class InterruptioneventStatusUsecase {

  final InterruptioneventStatusRepo interruptioneventStatusRepo;
InterruptioneventStatusUsecase(this.interruptioneventStatusRepo);


Future<ListInterruptionEventEntity> execute( String token, int orgid, int activityid, int imfgpid){
  return interruptioneventStatusRepo.getinterruptionStatus(token, orgid,activityid,imfgpid);
}

}