import 'package:flutter/material.dart';
import 'package:qc_control_app/feature/domain_layer/entity/eventquee_entity.dart';

class EventqueeProvider extends ChangeNotifier{
 EventQueeEntity ? _event;

 EventQueeEntity? get event=>_event;

 void setEventquee(EventQueeEntity eventquee){
  _event=eventquee;
  notifyListeners();
 }

}