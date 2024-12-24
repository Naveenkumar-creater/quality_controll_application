import 'package:qc_control_app/feature/domain_layer/entity/eventquee_entity.dart';
import 'package:qc_control_app/feature/domain_layer/repository/event_repository.dart';

class EventQueeUsecase{

  final EventQueeRepository eventRepository;
EventQueeUsecase(this.eventRepository);

Future<EventQueeEntity> getEventQuee ( String token,int status,  int processid ){
 return  eventRepository.getEventQuee(token, status, processid); 
}
}