import 'package:qc_control_app/feature/domain_layer/entity/process_entity.dart';
import 'package:qc_control_app/feature/domain_layer/repository/process_repository.dart';

class ProcessUsecase {
  final ProcessRepository processRepository;
  ProcessUsecase(this.processRepository);

  Future<ProcessEntity> execute(
    String token,
    int deptid
  ) async {
    return processRepository.getProcessList(token,deptid);
  }
}
