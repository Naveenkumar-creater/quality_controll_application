import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constant/Exception/show_pop_error.dart';
import 'package:qc_control_app/feature/data_layer/remote/process_datasource.dart';
import 'package:qc_control_app/feature/data_layer/repository/process_repo_impl.dart';
import 'package:qc_control_app/feature/domain_layer/entity/process_entity.dart';
import 'package:qc_control_app/feature/domain_layer/usecase/process_usecase.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/process_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProcessApiService {
  Future<void> getProcessdetail({
    required BuildContext context,

    //required emp_mgr,
  }) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String token = pref.getString("client_token") ?? "";
      ProcessUsecase processUsecase = ProcessUsecase(ProcessRepositoryImpl(ProcessDatasourceImpl()));
 int? orgid=Provider.of<LoginProvider>(context, listen: false).user?.userLoginEntity?.orgId  ?? 0;
      ProcessEntity user = await processUsecase.execute(token, orgid);

      Provider.of<ProcessProvider>(context, listen: false).setUser(user);
    } catch (e) {
      ShowError.showAlert(context, e.toString());
      rethrow;
    }
  }
}
