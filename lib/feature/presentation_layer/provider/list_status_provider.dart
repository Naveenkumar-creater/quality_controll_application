import 'package:flutter/material.dart';
import 'package:qc_control_app/feature/domain_layer/entity/list_status_entity.dart';

class ListStatusProvider extends ChangeNotifier{
  ListStatusEntity ? _status;

  ListStatusEntity ? get status=> _status;

  void setStatus( ListStatusEntity? data){
    _status=data;
    notifyListeners();

  }
}