import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constant/Exception/show_pop_error.dart';
import 'package:qc_control_app/feature/data_layer/remote/reaction_datasource.dart';
import 'package:qc_control_app/feature/data_layer/repository/reaction_repo_impl.dart';
import 'package:qc_control_app/feature/domain_layer/entity/reaction_entity.dart';
import 'package:qc_control_app/feature/domain_layer/usecase/reaction_usecase.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/reaction_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReactionDi {

  Future<void> getReaction({
    
  required BuildContext context,
  required int queeid,
  required int queestatus,
  required int eventtriggerid,
  required int imfgpid,
  required int cphid,
  required int previouseventid

  })
  async{

try {

  SharedPreferences pref=await  SharedPreferences.getInstance();

  String token= pref.getString("client_token") ?? "";

  ReactionUsecase reaction=ReactionUsecase(ReactionRepoImpl(ReactionDatasourceImpl()));
    // ignore: use_build_context_synchronously
    int? orgid=Provider.of<LoginProvider>(context, listen: false).user?.userLoginEntity?.orgId  ?? 0;

  ReactionEntity getreaction= await reaction.getReactionList(token, eventtriggerid, queeid, queestatus, imfgpid, cphid,previouseventid, orgid);

  Provider.of<ReactionProvider>(context, listen: false).setReaction(getreaction);
  
} catch (e) {
  ShowError.showAlert(context, e.toString());
  
}
  }
  
}