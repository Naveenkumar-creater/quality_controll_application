import 'package:flutter/material.dart';
import 'package:qc_control_app/feature/domain_layer/entity/login_entity.dart';

class LoginProvider extends ChangeNotifier {
  LoginEntity? _user;
  LoginEntity? get user => _user;
  void setUser(LoginEntity loginuser) {
    _user = loginuser;
    notifyListeners();
  }
  
    void reset() {
    _user = null;
    notifyListeners();
  }

}
