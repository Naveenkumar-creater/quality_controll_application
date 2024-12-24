import 'package:flutter/material.dart';
import 'package:qc_control_app/feature/domain_layer/entity/inspectionsample_entity.dart';

class InspectionsampleProvider extends ChangeNotifier{
  InspectionSampleEntity ? _sample;

  InspectionSampleEntity? get sample => _sample;

  void setSample(InspectionSampleEntity samplelist){

_sample=samplelist;
notifyListeners();
  }


}