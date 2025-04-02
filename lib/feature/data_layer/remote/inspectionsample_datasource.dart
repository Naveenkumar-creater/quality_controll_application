import 'package:qc_control_app/constatnt/api_connection.dart';
import 'package:qc_control_app/constatnt/request_data_model.dart/api_request_model.dart';
import 'package:qc_control_app/feature/data_layer/model/inspectionSample_model.dart';

abstract class InspectionSampleDatasource{

  Future<InspectionSampleModel>getSampleList(String token, int headerid, int activityid, int orgid, int processid, 
  int eventid, int imfgpid, int eventtriggerid,  int samplesize, int queeid, int queestatus);

}


class InspectionsampleDatasourceImpl extends InspectionSampleDatasource{
  @override
  Future<InspectionSampleModel> getSampleList(String token, int headerid, int activityid, int orgid, int processid, 
  int eventid, int imfgpid, int eventtriggerid,  int samplesize, int queeid, int queestatus
  )async {

   ApiRequestDataModel request=  ApiRequestDataModel(
    apiFor: "list_of_samples",
   controlplanheaderid:headerid, 
    activityid: activityid, 
    clientAuthToken: token,
   orgid:orgid,
    processId:  processid,eventid: eventid,
    imfgpid: imfgpid,
    eventtrigerid: eventtriggerid,
    samplesize:samplesize ,
    queeid: queeid,
    questatus:queestatus );
  final response= await ApiConstant.makeApiRequest(requestBody: request);

  final result = InspectionSampleModel.fromJson(response);
  print(result.listOfSamplesEntity);


  return result;

  }
  
}




// "{
// "client_aut_token": "goutham-4676",
// "api_for": "list_of_samples",
// "queue_id":1,
// "imfgp_id":1,
// "imfgp_pa_id":13,
// "mpm_id":5,
// "cph_id":1,
// "event_id":1,
// "event_trigger_id":1,
// "sample_size":5,
// "que_status":1,
// "org_id":1
// }
// "