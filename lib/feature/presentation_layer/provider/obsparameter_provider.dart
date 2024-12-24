import 'package:flutter/material.dart';
import 'package:qc_control_app/feature/domain_layer/entity/obsparameter_entity.dart';

class ObsparameterProvider extends ChangeNotifier{
   ObsParameterEntity ? _param;

ObsParameterEntity ? get obsparam=>_param;

void setobsparam(ObsParameterEntity  param){
  _param=param;
  notifyListeners();

}


reset(){
 _param=null;
 notifyListeners(); 
}

}


