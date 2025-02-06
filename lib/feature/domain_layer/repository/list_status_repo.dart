import 'package:qc_control_app/feature/domain_layer/entity/list_status_entity.dart';

abstract class ListStatusRepo{
  Future<ListStatusEntity> getStatus(String token, int orgid);
}