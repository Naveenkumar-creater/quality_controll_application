import 'package:flutter/material.dart';
import 'package:qc_control_app/feature/domain_layer/entity/reaction_entity.dart';

class ReactionProvider extends ChangeNotifier{

  ReactionEntity ? _reaction;

  ReactionEntity ? get reaction => _reaction;

  void setReaction( ReactionEntity ? data){
    _reaction=data;
    notifyListeners();

  }
}