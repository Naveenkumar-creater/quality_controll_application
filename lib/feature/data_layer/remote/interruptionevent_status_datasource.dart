import 'package:qc_control_app/constatnt/api_connection.dart';
import 'package:qc_control_app/constatnt/request_data_model.dart/api_request_model.dart';
import 'package:qc_control_app/feature/data_layer/model/interruptevent_status_model.dart';

abstract class InterruptionEventStatusDatasource{
  Future<ListInterruptionEventModel> getinterruptionStatus(String token, int orgid, int activityid, int imfgpid);
}

class InterruptionEventStatusDatasourceImpl implements InterruptionEventStatusDatasource{
  @override
  Future<ListInterruptionEventModel> getinterruptionStatus(String token, int orgid, int activityid, int imfgpid) async{
   ApiRequestDataModel request=ApiRequestDataModel(apiFor: "list_of_interruption_event",clientAuthToken: token,
   imfgpid: imfgpid,
   activityid:activityid,orgid:orgid );
  
  final response= await ApiConstant.makeApiRequest(requestBody: request);
  final result=  ListInterruptionEventModel.fromJson(response);

  return result;
  
  }

}