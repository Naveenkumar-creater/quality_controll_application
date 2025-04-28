import 'package:qc_control_app/constant/api_connection.dart';
import 'package:qc_control_app/constant/request_data_model.dart/api_request_model.dart';
import 'package:qc_control_app/feature/data_layer/model/inspectionSample_model.dart';

abstract class InspectionSampleDatasource{

  Future<InspectionSampleModel>getSampleList(String token, int headerid, int activityid, int orgid, int processid, 
  int eventid, int imfgpid, int eventtriggerid,  int samplesize, int queeid, int queestatus,int samplesetheaderid,double productionqty,int samplesetstatus, int samplesetindex, int toolId);

}


class InspectionsampleDatasourceImpl extends InspectionSampleDatasource{
  @override
  Future<InspectionSampleModel> getSampleList(String token, int headerid, int activityid, int orgid, int processid, 
  int eventid, int imfgpid, int eventtriggerid,  int samplesize, int queeid, int queestatus,int samplesetheaderid,double productionqty,int samplesetstatus, int samplesetindex, int toolId
  )async {

   ApiRequestDataModel request=  ApiRequestDataModel(
    apiFor: "list_of_samples",
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
    questatus:queestatus,
    productionqty: productionqty,
    samplesetheaderid: samplesetheaderid,    
    samplesetindex:samplesetindex ,
    samplesetstatus: samplesetstatus,
    toolid:toolId
    );



  final response= await ApiConstant.makeApiRequest(requestBody: request);

  final result = InspectionSampleModel.fromJson(response);
  print(result.listOfSamplesEntity);


  return result;

  }
  
}