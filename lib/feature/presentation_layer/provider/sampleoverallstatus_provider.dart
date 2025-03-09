import 'package:flutter/material.dart';
import 'package:qc_control_app/feature/domain_layer/entity/actionstep_entity.dart';

class SampleoverallstatusProvider extends ChangeNotifier{

  ActionStepEntity? _sampleoverallstatus;

  ActionStepEntity? get overrallstatus=>_sampleoverallstatus;

  void setActionstep(ActionStepEntity data){

   _sampleoverallstatus=data;

     notifyListeners();
  }


}