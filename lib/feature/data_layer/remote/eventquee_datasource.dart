import 'package:qc_control_app/constant/api_connection.dart';
import 'package:qc_control_app/constant/request_data_model.dart/api_request_model.dart';
import 'package:qc_control_app/feature/data_layer/model/evenquee_model.dart';

abstract class EventqueeDatasource {

  Future<EventQueeModel> getEventQuee(String token,int status,int processid,int orgid);
  
}



class EventqueeDatasourceImpl implements EventqueeDatasource {
  @override
  Future<EventQueeModel> getEventQuee(String token, int status, int processid,int orgid) async{
   ApiRequestDataModel request=ApiRequestDataModel(apiFor: "list_of_events_queue",clientAuthToken:token, statuscount:status, processId: processid,orgid:orgid);
   final response=await ApiConstant.makeApiRequest(requestBody: request);
   final result = EventQueeModel.fromJson(response);
   return result;
  }
  
}
