import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constatnt/Exception/show_pop_error.dart';
import 'package:qc_control_app/feature/data_layer/remote/list_status_datasource.dart';
import 'package:qc_control_app/feature/data_layer/repository/list_status_repo_impl.dart';
import 'package:qc_control_app/feature/domain_layer/usecase/list_status_usecase.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/list_status_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListstatusDi{
  Future<void> getStatus({
    required BuildContext context,
  
  })
  async {

try {

  SharedPreferences pref = await SharedPreferences.getInstance();
  String token =pref.getString("client_token") ?? "";

  ListStatusUsecase listStatusUsecase= ListStatusUsecase(ListStatusRepoImpl(ListStatusDatasourceImpl()));
  int? orgid=Provider.of<LoginProvider>(context, listen: false).user?.userLoginEntity?.orgId  ?? 0;
  final result= await listStatusUsecase.execute(token, orgid);

  Provider.of<ListStatusProvider>(context,listen: false).setStatus(result);
} catch (e) {
  ShowError.showAlert(context, e.toString());
}
  }
}