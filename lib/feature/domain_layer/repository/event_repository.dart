import 'package:qc_control_app/feature/domain_layer/entity/eventquee_entity.dart';

abstract class EventQueeRepository{
  Future<EventQueeEntity> getEventQuee( String token, int Status,  int processid, int orgid);
}