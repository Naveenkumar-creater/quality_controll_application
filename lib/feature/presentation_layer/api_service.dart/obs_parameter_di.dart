import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constatnt/Exception/show_pop_error.dart';
import 'package:qc_control_app/feature/data_layer/remote/obsparameter_datasource.dart';
import 'package:qc_control_app/feature/data_layer/repository/obsparameter_repo_impl.dart';
import 'package:qc_control_app/feature/domain_layer/entity/obsparameter_entity.dart';
import 'package:qc_control_app/feature/domain_layer/usecase/obsparameter_usecase.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/obsparameter_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ObsParameterDi{
  Future<void>getParameterList({
 required BuildContext context,
 required int inspectionid
  })async{

try {

 ObsparameterUsecase obsSampleUsecase=ObsparameterUsecase(ObsparameterRepoImpl(ObsparameterDatasourceImple()));

 SharedPreferences pref=await SharedPreferences.getInstance();

 String token = pref.getString("client_token") ?? "";
   int? orgid=Provider.of<LoginProvider>(context, listen: false).user?.userLoginEntity?.orgId  ?? 0;

 ObsParameterEntity obssample= await obsSampleUsecase.getparameter(token, inspectionid, orgid);
 

 return Provider.of<ObsparameterProvider>(context,listen: false).setobsparam(obssample);
  
} catch (e) {
  ShowError.showAlert(context, e.toString());
}
  }
}