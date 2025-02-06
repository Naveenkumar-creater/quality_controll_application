import 'package:qc_control_app/feature/domain_layer/entity/process_entity.dart';

abstract class ProcessRepository {
  Future<ProcessEntity> getProcessList(String token, int orgid);
}
