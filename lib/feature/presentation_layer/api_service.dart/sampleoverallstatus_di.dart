import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constatnt/Exception/show_pop_error.dart';
import 'package:qc_control_app/feature/data_layer/remote/actionstep_datasource.dart';
import 'package:qc_control_app/feature/data_layer/repository/actionstep_repo_impl.dart';
import 'package:qc_control_app/feature/domain_layer/usecase/actionstep_usecase.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/sampleoverallstatus_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SampleoverallstatusDi{
  Future<void>getAction({
 required BuildContext context,
 required String clgroup,
  })async{

try {

  ActionstepUsecase actionstep=ActionstepUsecase(ActionstepRepoImpl(ActionstepDatasourceImpl()));

  SharedPreferences pref=await SharedPreferences.getInstance();

 String token = pref.getString("client_token") ?? "";

  int? orgid=Provider.of<LoginProvider>(context, listen: false).user?.userLoginEntity?.orgId  ?? 0;

 final result= await actionstep.getActionList(token,clgroup, orgid);

 return Provider.of<SampleoverallstatusProvider>(context,listen: false).setActionstep(result);
  
} catch (e) {
  ShowError.showAlert(context, e.toString());
}
  }
}