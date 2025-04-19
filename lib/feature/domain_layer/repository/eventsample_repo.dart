import 'package:qc_control_app/feature/domain_layer/entity/eventsampleset_entity.dart';

abstract class EventSamplesetRepo{
  Future<EventsampleSetEntity> getEventSampleset(String token, int headerid, int activityid, int orgid, int processid, 
  int eventid, int imfgpid, int eventtriggerid,  int samplesize, int queeid, int queestatus);
}