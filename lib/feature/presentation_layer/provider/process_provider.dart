import 'package:flutter/material.dart';
import 'package:qc_control_app/feature/domain_layer/entity/process_entity.dart';


class ProcessProvider extends ChangeNotifier {
  ProcessEntity? _user;
  ProcessEntity? get user => _user;
  void setUser(ProcessEntity process) {
    _user = process;
    notifyListeners();
  }

    void reset() {
    _user = null;
    notifyListeners();
  }

}
