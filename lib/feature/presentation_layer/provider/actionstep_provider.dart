import 'package:flutter/material.dart';
import 'package:qc_control_app/feature/domain_layer/entity/actionstep_entity.dart';

class ActionstepProvider extends ChangeNotifier{

  ActionStepEntity? _actionstep;

  ActionStepEntity? get action=>_actionstep;

  void setActionstep(ActionStepEntity data){

   _actionstep=data;

     notifyListeners();
  }


}