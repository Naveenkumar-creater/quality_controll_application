import 'package:qc_control_app/feature/data_layer/model/evenquee_model.dart';
import 'package:qc_control_app/feature/data_layer/remote/eventquee_datasource.dart';
import 'package:qc_control_app/feature/domain_layer/entity/eventquee_entity.dart';
import 'package:qc_control_app/feature/domain_layer/repository/event_repository.dart';

class EventQueeRepositoryImpl implements EventQueeRepository {
  final EventqueeDatasource  eventqueeDatasource;
  
  EventQueeRepositoryImpl(this.eventqueeDatasource);

  @override
  Future<EventQueeModel> getEventQuee(String token, int status,  int processid) {

  final eventquee=eventqueeDatasource.getEventQuee(token, status, processid);
    return eventquee;

  }
  
}