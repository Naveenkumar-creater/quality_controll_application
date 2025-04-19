
import 'package:qc_control_app/constant/api_connection.dart';
import 'package:qc_control_app/constant/request_data_model.dart/api_request_model.dart';
import 'package:qc_control_app/feature/data_layer/model/inspectionParameter_model.dart';

abstract class InspectionparameterDatasource{
  Future<InspectionParameterModel> getParameterList(String token, int headerId, int activityId, int orgid);
}

class InspectionparameterDatasourceImpl implements InspectionparameterDatasource{
  @override
  Future<InspectionParameterModel> getParameterList(String token, int headerId, int activityId, int orgid) async{
   ApiRequestDataModel request=ApiRequestDataModel(apiFor: "list_of_parameters",clientAuthToken: token,controlplanheaderid:headerId,activityid:activityId,orgid:orgid );
  
  final response= await ApiConstant.makeApiRequest(requestBody: request);
  final result=  InspectionParameterModel.fromJson(response);

  return result;
  
  }

}