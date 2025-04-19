import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constant/Exception/show_pop_error.dart';
import 'package:qc_control_app/feature/data_layer/remote/listofrestart_datasource.dart';
import 'package:qc_control_app/feature/data_layer/repository/listofrestartevent_repo_impl.dart';
import 'package:qc_control_app/feature/domain_layer/usecase/listofrestartevent_usecase.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/listofrestartevent_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListofrestartDi{
  Future<void>getRestartEvent
  ({
 required BuildContext context,
 required int imfgpid,
 required int activityid
  })async{

try {

ListofrestarteventUsecase restartevent=ListofrestarteventUsecase(ListofrestarteventRepoImpl(ListofrestartDatasourceImpl()));

 SharedPreferences pref=await SharedPreferences.getInstance();

 String token = pref.getString("client_token") ?? "";

 int? orgid=Provider.of<LoginProvider>(context, listen: false).user?.userLoginEntity?.orgId  ?? 0;

 final result= await restartevent.getRestartEvent(token,imfgpid, activityid, orgid);

 return Provider.of<ListofrestarteventProvider>(context,listen: false).setRestartEvetn(result);
  
} catch (e) {
  ShowError.showAlert(context, e.toString());
}
  }
}