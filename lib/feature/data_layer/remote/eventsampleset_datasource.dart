import 'package:qc_control_app/constant/api_connection.dart';
import 'package:qc_control_app/constant/request_data_model.dart/api_request_model.dart';
import 'package:qc_control_app/feature/data_layer/model/eventsampleset_model.dart';

abstract class EventsamplesetDatasource{

  Future<EventSampleSetModel>getEventSampleSet(String token, int headerid, int activityid, int orgid, int processid, 
  int eventid, int imfgpid, int eventtriggerid,  int samplesize, int queeid, int queestatus);

}


class EventsamplesetDatasourceImpl extends EventsamplesetDatasource{
  @override
  Future<EventSampleSetModel> getEventSampleSet(String token, int headerid, int activityid, int orgid, int processid, 
  int eventid, int imfgpid, int eventtriggerid,  int samplesize, int queeid, int queestatus
  )async {

   ApiRequestDataModel request=  ApiRequestDataModel(
    apiFor: "list_of_samplesset",
   controlplanheaderid:headerid, 
    activityid: activityid, 
    clientAuthToken: token,
    orgid:orgid,
    processId:  processid,
    eventid: eventid,
    imfgpid: imfgpid,
    eventtrigerid: eventtriggerid,
    samplesize:samplesize ,
    queeid: queeid,
    questatus:queestatus );

  final response= await ApiConstant.makeApiRequest(requestBody: request);

  final result = EventSampleSetModel.fromJson(response);

  return result;

  }
  
}
