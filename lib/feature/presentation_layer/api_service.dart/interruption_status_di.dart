import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constatnt/Exception/show_pop_error.dart';
import 'package:qc_control_app/feature/data_layer/remote/interruptionevent_status_datasource.dart';
import 'package:qc_control_app/feature/data_layer/repository/interruptionevent_status_repo_impl.dart';
import 'package:qc_control_app/feature/domain_layer/entity/interruptionevent_status_entity.dart';
import 'package:qc_control_app/feature/domain_layer/usecase/interruptionevent_status_usecase.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/interruptionevent_status_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InterruptionStatusDi{
  Future<void>getInterruptionEventStatus({
 required BuildContext context,
 required int activityId,
 required int imfgpid
  })async{

try {

 InterruptioneventStatusUsecase interruptioneventStatusUsecase=InterruptioneventStatusUsecase(InterruptioneventStatusRepoImpl(InterruptionEventStatusDatasourceImpl()));

 SharedPreferences pref=await SharedPreferences.getInstance();

 String token = pref.getString("client_token") ?? "";
   int? orgid=Provider.of<LoginProvider>(context, listen: false).user?.userLoginEntity?.orgId  ?? 0;

 ListInterruptionEventEntity interruptionStatus= await interruptioneventStatusUsecase.execute(token,orgid,activityId,imfgpid);
 
 return Provider.of<InterruptioneventStatusProvider>(context,listen: false).setInterruptionStatus(interruptionStatus);
  
} catch (e) {
  ShowError.showAlert(context, e.toString());
}
  }
}