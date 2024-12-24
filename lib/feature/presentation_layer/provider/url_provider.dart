import 'package:flutter/material.dart';


class UrlProvider extends ChangeNotifier {
  String  _user = "http://192.168.29.14:8081/btecManufacturer_Els/primefaces_manufacture/flutterlayout1.xhtml";

  String? get user => _user;

  void setUser(String url) {
    _user = url;

    print("update url");
    notifyListeners();
  }
}
