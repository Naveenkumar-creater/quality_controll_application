import 'package:http/http.dart';
import 'package:qc_control_app/constant/api_connection.dart';
import 'package:qc_control_app/constant/request_data_model.dart/api_request_model.dart';
import 'package:qc_control_app/feature/data_layer/model/login_model.dart';


abstract class LoginDataSource {
  Future<LoginModel> loginInUser(String loginId, String password);
}

class LoginDataSourceImpl extends LoginDataSource {

  @override
  Future<LoginModel> loginInUser(String loginId, String password) async {
    ApiRequestDataModel request =  ApiRequestDataModel(apiFor: "generate_access_token",loginPassword:password,clGroup:"patienttype",loginId: loginId);
    final response=await ApiConstant.loginApiRequest(requestBody:request);
    final result = LoginModel.fromJson(response);
  
    print(result);

    return result;
  }
}
