import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constant/Exception/show_pop_error.dart';
import 'package:qc_control_app/feature/data_layer/remote/inspectionparameter_datasource.dart';
import 'package:qc_control_app/feature/data_layer/repository/inspectionparameter_repo_impl.dart';
import 'package:qc_control_app/feature/domain_layer/entity/inspectionparameter_entity.dart';
import 'package:qc_control_app/feature/domain_layer/usecase/inspectionparameter_usecase.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/inspectionparameter_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InspectionparameterDi{
  Future<void> getInpectionParam({
    required BuildContext context,
 required int headerId,
 required int activityId
 } )async{
    try {

  SharedPreferences pref=await SharedPreferences.getInstance();

 String token = pref.getString("client_token") ?? "";

 InspectionparameterUsecase  parameterUsecase =InspectionparameterUsecase(InspectionparameterRepoImpl(InspectionparameterDatasourceImpl()));
  int? orgid=Provider.of<LoginProvider>(context, listen: false).user?.userLoginEntity?.orgId  ?? 0;
InspectionParameterEntity result= await parameterUsecase.getParameterList(token, headerId,activityId, orgid);
 Provider.of<InspectionparameterProvider>(context,listen: false).setInspectionParam(result);
    } catch (e) {

       ShowError.showAlert(context, e.toString());
      
    }

  }
}