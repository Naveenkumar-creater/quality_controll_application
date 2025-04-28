import 'package:flutter/material.dart';
import 'package:qc_control_app/feature/presentation_layer/local_stored_data_model/eventqueelocaldata_model.dart';

class EventqueelocaldataProvider extends ChangeNotifier{
  EventQueuelocalDataModel ? _queedata;

  EventQueuelocalDataModel? get queedata=>_queedata;

  void setEventqueedata(EventQueuelocalDataModel data){
    _queedata=data;
    notifyListeners();

  }

  void reset(){
    _queedata=null;
    notifyListeners(); 
  }
}