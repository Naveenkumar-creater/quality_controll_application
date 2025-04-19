import 'package:qc_control_app/constant/api_connection.dart';
import 'package:qc_control_app/constant/request_data_model.dart/api_request_model.dart';
import 'package:qc_control_app/feature/data_layer/model/listofrestartevent_model.dart';

abstract class ListofrestartDatasource{
  Future<ListofRestartEventModel> getRestartEvent(String token,int imfgpid,int activityid,  int orgid);
}
class ListofrestartDatasourceImpl extends ListofrestartDatasource{
  @override
  Future<ListofRestartEventModel> getRestartEvent(String token,int imfgpid,int activityid,  int orgid) async{
    ApiRequestDataModel request=ApiRequestDataModel(apiFor: "list_of_normal_event",clientAuthToken:token,imfgpid: imfgpid,activityid: activityid, orgid:orgid);
   final response=await ApiConstant.makeApiRequest(requestBody: request);
   final result = ListofRestartEventModel.fromJson(response);
   return result;

  }
  
}