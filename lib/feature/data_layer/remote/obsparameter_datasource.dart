import 'package:qc_control_app/constant/api_connection.dart';
import 'package:qc_control_app/constant/request_data_model.dart/api_request_model.dart';
import 'package:qc_control_app/feature/data_layer/model/obsParameter_model.dart';

abstract class ObsparameterDatasource{
  Future<ObsParameterModel>  getParaneter(String token, int sampleId, int orgid,  int previousid);
}


class ObsparameterDatasourceImple extends ObsparameterDatasource {

@override
Future<ObsParameterModel> getParaneter(String token, int sampleId, int orgid, int previousid) async{
 ApiRequestDataModel request=ApiRequestDataModel(apiFor: "observation_of_params",clientAuthToken: token,iqciisid:sampleId, orgid: orgid,previouseventid:previousid,);
 final response=  await ApiConstant.makeApiRequest(requestBody: request);

 final result= ObsParameterModel.fromJson(response);

 print(result);
 return result;

  }
  
}

