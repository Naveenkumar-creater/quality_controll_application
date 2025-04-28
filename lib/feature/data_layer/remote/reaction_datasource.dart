import 'package:qc_control_app/constant/api_connection.dart';
import 'package:qc_control_app/constant/request_data_model.dart/api_request_model.dart';
import 'package:qc_control_app/feature/data_layer/model/reaction_model.dart';

abstract class ReactionDatasource{
  Future<ReactionModel> getReaction(String token, int eventtrigerid,int queeid, int queestatus, int imfgpid,int cphid,int previousevenid, int orgid );
}

class ReactionDatasourceImpl implements ReactionDatasource{
  @override
  Future<ReactionModel> getReaction(String token, int eventtrigerid,int queeid, int queestatus, int imfgpid,int cphid,int previousevenid, int orgid ) async{
   ApiRequestDataModel request=ApiRequestDataModel(apiFor: "list_of_reaction",clientAuthToken: token,
 eventtrigerid: eventtrigerid,
controlplanheaderid:cphid,
queeid: queeid,
questatus: queestatus,
imfgpid: imfgpid,
previouseventid:previousevenid,
orgid:orgid,
 );

  
  final response= await ApiConstant.makeApiRequest(requestBody: request);
  final result=  ReactionModel.fromJson(response);

  return result;
  
  }

}