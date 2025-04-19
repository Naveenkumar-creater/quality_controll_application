import 'package:qc_control_app/constant/api_connection.dart';
import 'package:qc_control_app/constant/request_data_model.dart/api_request_model.dart';
import 'package:qc_control_app/feature/data_layer/model/actionstep_model.dart';

abstract class ActionstepDatasource{
  Future<ActionStepModel> getAction(String token, String clgroup, int orgid);
}
class ActionstepDatasourceImpl extends ActionstepDatasource{
  @override
  Future<ActionStepModel> getAction(String token, String clgroup, int orgid) async{
      ApiRequestDataModel request=ApiRequestDataModel(apiFor: "code_list",clientAuthToken:token,clGroup:clgroup,orgid:orgid);
   final response=await ApiConstant.makeApiRequest(requestBody: request);
   final result = ActionStepModel.fromJson(response);
   return result;

  }
  
}