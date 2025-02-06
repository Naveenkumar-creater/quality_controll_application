// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:qc_control_app/feature/data_layer/model/process_model.dart';
import 'package:qc_control_app/feature/data_layer/remote/process_datasource.dart';
import 'package:qc_control_app/feature/domain_layer/repository/process_repository.dart';


class ProcessRepositoryImpl implements ProcessRepository {
  final ProcessDatasource processDatasource;
  ProcessRepositoryImpl(
    this.processDatasource,
  );
  @override
  Future<ProcessModel> getProcessList(
    String token, int orgid
  ) async {
    final result = await processDatasource.getProcessList(token, orgid);
    return result;
  }
}
