import 'package:qc_control_app/feature/data_layer/remote/list_status_datasource.dart';
import 'package:qc_control_app/feature/domain_layer/entity/list_status_entity.dart';
import 'package:qc_control_app/feature/domain_layer/repository/list_status_repo.dart';

class ListStatusRepoImpl implements ListStatusRepo{

  final ListStatusDatasource  listStatusDatasource;
  ListStatusRepoImpl(this.listStatusDatasource);


  @override
  Future<ListStatusEntity> getStatus(String token, int orgid) {

    return listStatusDatasource.getstatus(token, orgid);

  }
  
}