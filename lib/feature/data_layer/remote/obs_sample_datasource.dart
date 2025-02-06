import 'package:qc_control_app/constatnt/api_connection.dart';
import 'package:qc_control_app/constatnt/request_data_model.dart/api_request_model.dart';
import 'package:qc_control_app/feature/data_layer/model/obsSample_model.dart';

abstract class ObsSampleDatasource {
Future <ObsSampleModel>getSample(String token, int inspectionId, int orgid);
}


class ObsSampleDatasourceImple extends ObsSampleDatasource{
  @override
  Future<ObsSampleModel> getSample(String token, int inspectionId, int orgid)async  {
    ApiRequestDataModel request=ApiRequestDataModel(apiFor: "observation_by_samples",clientAuthToken: token,inspectionid:inspectionId, orgid: orgid);

    final  response = await ApiConstant.makeApiRequest(requestBody: request);

    final result= ObsSampleModel.fromJson(response);

    return result;

  }
  
}