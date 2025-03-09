import 'package:flutter/material.dart';
import 'package:qc_control_app/feature/domain_layer/entity/listofrestart_entity.dart';

class ListofrestarteventProvider extends ChangeNotifier{

  ListofRestartEventEntity ?  _restartEvent;

    ListofRestartEventEntity ? get restartEvent  =>  _restartEvent;


    void setRestartEvetn(ListofRestartEventEntity ? data){
      _restartEvent=data;

      notifyListeners();

    }
}