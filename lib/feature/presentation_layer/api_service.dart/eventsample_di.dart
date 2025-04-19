import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constant/Exception/show_pop_error.dart';
import 'package:qc_control_app/feature/data_layer/remote/eventsampleset_datasource.dart';
import 'package:qc_control_app/feature/domain_layer/entity/eventsampleset_entity.dart';
import 'package:qc_control_app/feature/domain_layer/usecase/eventsample_usecase.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data_layer/repository/eventsampleset_repo_impl.dart';
import '../provider/eventsampleset_provider.dart';

class EventsampleDi{
  Future<void> getEventSampleList({
required BuildContext context,
required int headerid,
required int activityid, 
required int processid, 
 required int eventid, 
 required int imfgpid,
 required int eventtriggerid, 
 required int samplesize,
 required int queeid, 
 required int queestatus
  }) async{

    try {
      
      SharedPreferences pref=  await SharedPreferences.getInstance();
      String token =pref.getString("client_token") ?? "";
       EventSamplesetUsecase eventSamplesetUsecase =EventSamplesetUsecase(EventsamplesetRepoImpl(EventsamplesetDatasourceImpl()));
  int? orgid=Provider.of<LoginProvider>(context, listen: false).user?.userLoginEntity?.orgId  ?? 0;
      EventsampleSetEntity response= await eventSamplesetUsecase.getEventSampleset(
       token,  headerid,  activityid,
         orgid, 
        processid, 
   eventid,  
   imfgpid,  
   eventtriggerid,  
    samplesize,  queeid,  queestatus);

 Provider.of<EventSampleSetProvider>(context,listen: false).setSample(response);

    } catch (e) {
      ShowError.showAlert(context, e.toString());
      
    }

  }
}