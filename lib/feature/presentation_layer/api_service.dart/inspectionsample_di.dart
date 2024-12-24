import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constatnt/Exception/show_pop_error.dart';
import 'package:qc_control_app/feature/data_layer/remote/inspectionsample_datasource.dart';
import 'package:qc_control_app/feature/data_layer/repository/inspectionsample_repo_impl.dart';
import 'package:qc_control_app/feature/domain_layer/entity/inspectionsample_entity.dart';
import 'package:qc_control_app/feature/domain_layer/usecase/inspectionsample_usecase.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/inspectionsample_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InspectionsampleDi{
  Future<void> getSampleList({
required BuildContext context,
required int headerid,
required int activityid
  }) async{

    try {
      
      SharedPreferences pref=  await SharedPreferences.getInstance();
      String token =pref.getString("client_token") ?? "";

      InspectionsampleUsecase inspectionsampleUsecase=InspectionsampleUsecase(InspectionsampleRepoImpl(InspectionsampleDatasourceImpl()));

      InspectionSampleEntity response= await inspectionsampleUsecase.getSampleList(token, headerid, activityid);
 Provider.of<InspectionsampleProvider>(context,listen: false).setSample(response);

    } catch (e) {
      ShowError.showAlert(context, e.toString());
      
    }

  }
}