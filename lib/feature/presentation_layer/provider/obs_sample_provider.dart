import 'package:flutter/material.dart';
import 'package:qc_control_app/feature/domain_layer/entity/obs_sample_entity.dart';

class ObsSampleProvider extends ChangeNotifier{
 ObsSampleEntity ? _obssample;

 ObsSampleEntity? get obssample=>_obssample;

 void setSample(ObsSampleEntity sample){
  _obssample=sample;
  notifyListeners();
 }

}