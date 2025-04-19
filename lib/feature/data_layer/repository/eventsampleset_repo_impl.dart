import 'package:qc_control_app/feature/data_layer/model/eventsampleset_model.dart';
import 'package:qc_control_app/feature/data_layer/remote/eventsampleset_datasource.dart';
import 'package:qc_control_app/feature/domain_layer/repository/eventsample_repo.dart';



class EventsamplesetRepoImpl extends EventSamplesetRepo{

  final EventsamplesetDatasourceImpl eventsamplesetDatasourceImpl;
  EventsamplesetRepoImpl(this.eventsamplesetDatasourceImpl);


  @override
  Future<EventSampleSetModel> getEventSampleset(String token, int headerid, int activityid, int orgid, int processid, int eventid, int imfgpid, int eventtriggerid, int samplesize, int queeid, int queestatus) {
 final result= eventsamplesetDatasourceImpl.getEventSampleSet( token,  headerid,  activityid,  orgid,  processid, 
   eventid,  imfgpid,  eventtriggerid,   samplesize,  queeid,  queestatus);
    return result;
  }

}