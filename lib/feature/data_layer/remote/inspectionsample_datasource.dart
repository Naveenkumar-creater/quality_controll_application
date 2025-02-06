import 'package:qc_control_app/constatnt/api_connection.dart';
import 'package:qc_control_app/constatnt/request_data_model.dart/api_request_model.dart';
import 'package:qc_control_app/feature/data_layer/model/inspectionSample_model.dart';

abstract class InspectionSampleDatasource{

  Future<InspectionSampleModel>getSampleList(String token, int headerid, int activityid, int orgid);

}


class InspectionsampleDatasourceImpl extends InspectionSampleDatasource{
  @override
  Future<InspectionSampleModel> getSampleList(String token, int headerid, int activityid, int orgid)async {
   ApiRequestDataModel request=  ApiRequestDataModel(apiFor: "list_of_samples",controlplanheaderid:headerid, activityid: activityid, clientAuthToken: token,  orgid:orgid);
  final response= await ApiConstant.makeApiRequest(requestBody: request);

  final result=InspectionSampleModel.fromJson(response);
  return result;
  
  
  }
  
}