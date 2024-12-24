import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constatnt/Exception/show_pop_error.dart';
import 'package:qc_control_app/feature/data_layer/remote/obs_sample_datasource.dart';
import 'package:qc_control_app/feature/domain_layer/entity/obs_sample_entity.dart';
import 'package:qc_control_app/feature/domain_layer/usecase/obs_sample_usecase.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/obs_sample_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data_layer/repository/obs_sample_repo_impl.dart';


class ObsSampleDi{
  Future<void>getSampleList({
 required BuildContext context,
 required int inspectionid
  })async{

try {

  ObsSampleUsecase obsSampleUsecase=ObsSampleUsecase(ObsSampleRepoImpl(ObsSampleDatasourceImple()));

  SharedPreferences pref=await SharedPreferences.getInstance();

 String token = pref.getString("client_token") ?? "";

 ObsSampleEntity obssample= await obsSampleUsecase.getSample(token, inspectionid);
 

 return Provider.of<ObsSampleProvider>(context,listen: false).setSample(obssample);
  
} catch (e) {
  ShowError.showAlert(context, e.toString());
}
  }
}