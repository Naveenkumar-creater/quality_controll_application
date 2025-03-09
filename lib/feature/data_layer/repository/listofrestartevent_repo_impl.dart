import 'package:qc_control_app/feature/data_layer/remote/listofrestart_datasource.dart';

import '../../domain_layer/repository/listofrestartevent_repo.dart';
import '../model/listofrestartevent_model.dart';

class ListofrestarteventRepoImpl extends ListofrestarteventRepo {

final ListofrestartDatasource listofrestartDatasource;

ListofrestarteventRepoImpl(this.listofrestartDatasource);
  @override
  Future<ListofRestartEventModel> getRestartEvent(String token,int imfgpid,int activityid,  int orgid) {
 
  final result= listofrestartDatasource.getRestartEvent(token,imfgpid, activityid, orgid);

  return result;

  }
  
}