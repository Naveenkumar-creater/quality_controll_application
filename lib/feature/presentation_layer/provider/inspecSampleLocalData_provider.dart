import 'package:flutter/material.dart';
import 'package:qc_control_app/feature/presentation_layer/local_stored_data_model/inpecsamplelocaldata_model.dart';

class InspecsampleLocalDataProvider extends ChangeNotifier{
  InspectionSampleLocalModel ? _sampledata;

  InspectionSampleLocalModel? get sampledata=>_sampledata;

  void setSampledata(InspectionSampleLocalModel data){

    _sampledata=data;
    notifyListeners();

  }

  void reset(){
    _sampledata=null;
    notifyListeners(); 
  }
}