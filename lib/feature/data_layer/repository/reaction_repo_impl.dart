import 'package:qc_control_app/feature/data_layer/model/reaction_model.dart';
import 'package:qc_control_app/feature/data_layer/remote/reaction_datasource.dart';

import 'package:qc_control_app/feature/domain_layer/repository/reaction_repo.dart';


class ReactionRepoImpl implements ReactionRepo {
  final ReactionDatasource reactionDatasource;
  ReactionRepoImpl(
    this.reactionDatasource,
  );


  @override
  Future<ReactionModel> getReaction(String token, int eventtrigerid,int queeid, int queestatus, int imfgpid,int cphid,int previousevenid,int orgid) async{

    final result = await reactionDatasource.getReaction(token, eventtrigerid, queeid, queestatus, imfgpid, cphid, previousevenid, orgid);
    return result;
  }
}
