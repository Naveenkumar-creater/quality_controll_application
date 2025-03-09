import 'package:qc_control_app/feature/data_layer/model/interruptevent_status_model.dart';
import 'package:qc_control_app/feature/data_layer/remote/interruptionevent_status_datasource.dart';
import 'package:qc_control_app/feature/domain_layer/entity/list_status_entity.dart';
import 'package:qc_control_app/feature/domain_layer/repository/interruptionevent_status_repo.dart';

class InterruptioneventStatusRepoImpl extends InterruptioneventStatusRepo{

  final InterruptionEventStatusDatasource interruptionEventStatusDatasource;
  InterruptioneventStatusRepoImpl(this.interruptionEventStatusDatasource);

  @override
  Future<ListInterruptionEventModel> getinterruptionStatus(String token, int orgid, int activityid, int imfgpid) {

    final result=interruptionEventStatusDatasource.getinterruptionStatus(token, orgid, activityid, imfgpid);

    return result;

  }
  
 

}