import 'package:qc_control_app/feature/domain_layer/entity/list_status_entity.dart';
import 'package:qc_control_app/feature/domain_layer/repository/list_status_repo.dart';

class ListStatusUsecase {

  final ListStatusRepo listStatusRepo;
ListStatusUsecase(this.listStatusRepo);


Future<ListStatusEntity> execute( String token, int orgid){
  return listStatusRepo.getStatus(token, orgid);
}

}