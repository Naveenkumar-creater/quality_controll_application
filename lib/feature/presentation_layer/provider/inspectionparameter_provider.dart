import 'package:flutter/material.dart';

import 'package:qc_control_app/feature/domain_layer/entity/inspectionparameter_entity.dart';

class InspectionparameterProvider extends ChangeNotifier{
 InspectionParameterEntity ? _inspectionParam;

 InspectionParameterEntity? get inspectionParam=>_inspectionParam;

 void setInspectionParam(InspectionParameterEntity inspectionParam){
  _inspectionParam=inspectionParam;
  notifyListeners();
 }
 
    void reset() {
    _inspectionParam = null;
    notifyListeners();
  }

}