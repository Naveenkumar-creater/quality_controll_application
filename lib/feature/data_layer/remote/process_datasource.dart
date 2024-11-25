import 'package:qc_control_app/constatnt/api_connection.dart';
import 'package:qc_control_app/constatnt/request_data_model.dart/api_request_model.dart';
import 'package:qc_control_app/feature/data_layer/model/process_model.dart';


abstract class ProcessDatasource {
  Future<ProcessModel> getProcessList(String token,int deptid);
}

class ProcessDatasourceImpl implements ProcessDatasource {
 
  @override
  Future<ProcessModel> getProcessList(String token,int deptid) async {
    final request = await ApiRequestDataModel(apiFor: "list_of_process_v1",clientAuthToken: token,deptId:deptid );
    final response=await ApiConstant.makeApiRequest(requestBody: request);

    final result = ProcessModel.fromJson(response);

    return result;
  }
}
