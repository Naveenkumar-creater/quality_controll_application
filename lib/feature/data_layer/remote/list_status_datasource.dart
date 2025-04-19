import 'package:qc_control_app/constant/api_connection.dart';
import 'package:qc_control_app/constant/request_data_model.dart/api_request_model.dart';
import 'package:qc_control_app/feature/data_layer/model/list_status_model.dart';

abstract class ListStatusDatasource{
  Future<ListofStatusModel> getstatus(String token, int orgid);
}



class ListStatusDatasourceImpl implements ListStatusDatasource {
  @override
  Future<ListofStatusModel> getstatus(String token, int orgid) async{

    final request= ApiRequestDataModel(apiFor:"list_of_status_label", clientAuthToken: token, orgid: orgid );

    final response= await ApiConstant.makeApiRequest(requestBody: request);

    final result=ListofStatusModel.fromJson(response);

    return result;

  }

}