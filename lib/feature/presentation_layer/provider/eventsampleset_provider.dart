import 'package:flutter/material.dart';
import 'package:qc_control_app/feature/domain_layer/entity/eventsampleset_entity.dart';
import 'package:qc_control_app/feature/domain_layer/entity/inspectionsample_entity.dart';

class EventSampleSetProvider extends ChangeNotifier{
  EventsampleSetEntity ? _sampleset;

  EventsampleSetEntity? get sample => _sampleset;

  void setSample(EventsampleSetEntity samplelist){

_sampleset=samplelist;
notifyListeners();
  }


}