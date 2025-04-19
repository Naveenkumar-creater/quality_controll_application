
import 'package:qc_control_app/feature/domain_layer/entity/eventsampleset_entity.dart';
import 'package:qc_control_app/feature/domain_layer/repository/eventsample_repo.dart';

class EventSamplesetUsecase{

  final EventSamplesetRepo eventRepository;
EventSamplesetUsecase(this.eventRepository);

Future<EventsampleSetEntity> getEventSampleset(String token, int headerid, int activityid, int orgid, int processid, 
  int eventid, int imfgpid, int eventtriggerid,  int samplesize, int queeid, int queestatus){

 return  eventRepository.getEventSampleset( token,  headerid,  activityid,  orgid,  processid, 
   eventid,  imfgpid,  eventtriggerid,   samplesize,  queeid,  queestatus); 
}

}