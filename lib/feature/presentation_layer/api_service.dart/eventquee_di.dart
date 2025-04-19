import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constant/Exception/show_pop_error.dart';
import 'package:qc_control_app/feature/data_layer/remote/eventquee_datasource.dart';
import 'package:qc_control_app/feature/data_layer/repository/event_repo_impl.dart';
import 'package:qc_control_app/feature/domain_layer/entity/eventquee_entity.dart';
import 'package:qc_control_app/feature/domain_layer/usecase/evenquee_usecase.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/eventquee_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class EventqueeDi{
  Future<void>getEventquee({
 required BuildContext context,
 required int status,
 required int processid
  })async{

try {

  EventQueeUsecase eventQueeUsecase=EventQueeUsecase(EventQueeRepositoryImpl(EventqueeDatasourceImpl()));

  SharedPreferences pref=await SharedPreferences.getInstance();

 String token = pref.getString("client_token") ?? "";

  int? orgid=Provider.of<LoginProvider>(context, listen: false).user?.userLoginEntity?.orgId  ?? 0;
 EventQueeEntity eventQuee= await eventQueeUsecase.getEventQuee(token, status,processid, orgid);

 return Provider.of<EventqueeProvider>(context,listen: false).setEventquee(eventQuee);
  
} catch (e) {
  ShowError.showAlert(context, e.toString());
}
  }
}