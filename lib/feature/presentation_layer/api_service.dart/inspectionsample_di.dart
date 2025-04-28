import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constant/Exception/show_pop_error.dart';
import 'package:qc_control_app/feature/data_layer/remote/inspectionsample_datasource.dart';
import 'package:qc_control_app/feature/data_layer/repository/inspectionsample_repo_impl.dart';
import 'package:qc_control_app/feature/domain_layer/entity/inspectionsample_entity.dart';
import 'package:qc_control_app/feature/domain_layer/usecase/inspectionsample_usecase.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/inspectionsample_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InspectionsampleDi {
  Future<void> getSampleList(
      {
        required BuildContext context,
      required int headerid,
      required int activityid,
      required int processid,
      required int eventid,
      required int imfgpid,
      required int eventtriggerid,
      required int samplesize,
      required int queeid,
      required int queestatus,
      required int samplesetheaderid,
      required double productionqty,
      required int samplesetstatus,
      required int samplesetindex,
       required int toolId
      }) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String token = pref.getString("client_token") ?? "";

      InspectionsampleUsecase inspectionsampleUsecase = InspectionsampleUsecase(
          InspectionsampleRepoImpl(InspectionsampleDatasourceImpl()));
      int? orgid = Provider.of<LoginProvider>(context, listen: false)
              .user
              ?.userLoginEntity
              ?.orgId ?? 0;

      InspectionSampleEntity response =
          await inspectionsampleUsecase.getSampleList(
              token,
              headerid,
              activityid,
              orgid,
              processid,
              eventid,
              imfgpid,
              eventtriggerid,
              samplesize,
              queeid,
              queestatus,
              samplesetheaderid,
              productionqty,
                    samplesetstatus,
 samplesetindex,
 toolId
              );

 Provider.of<InspectionsampleProvider>(context, listen: false).setSample(response);

    } catch (e) {
      ShowError.showAlert(context, e.toString());
    }
  }
}
