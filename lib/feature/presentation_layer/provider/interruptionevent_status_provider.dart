import 'package:flutter/material.dart';
import 'package:qc_control_app/feature/domain_layer/entity/interruptionevent_status_entity.dart';

class InterruptioneventStatusProvider extends ChangeNotifier{

  ListInterruptionEventEntity? _interruptionEventStatus;

  ListInterruptionEventEntity? get interruptionStatus=>_interruptionEventStatus;

  void setInterruptionStatus(ListInterruptionEventEntity data){

   _interruptionEventStatus=data;

     notifyListeners();
  }


}