import 'package:flutter/material.dart';
import 'package:qc_control_app/feature/presentation_layer/local_stored_data_model/eventsamplesetdata_model.dart';

class EventsamplesetLocaldataProvider extends ChangeNotifier{
  EventsamplesetdatalocalModel ? _sampledata;

  EventsamplesetdatalocalModel? get sampledata=>_sampledata;

  void setSamplesetdata(EventsamplesetdatalocalModel data){

    _sampledata=data;
    notifyListeners();

  }

  void reset(){
    _sampledata=null;
    notifyListeners(); 
  }
}