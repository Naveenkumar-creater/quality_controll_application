import 'package:qc_control_app/feature/domain_layer/entity/reaction_entity.dart';
import 'package:qc_control_app/feature/domain_layer/repository/reaction_repo.dart';

class ReactionUsecase {

final ReactionRepo reactionRepo;

  ReactionUsecase(this.reactionRepo);


  Future<ReactionEntity> getReactionList(String token, int eventtrigerid,int queeid, int queestatus, int imfgpid,int cphid,int previousevenid, int orgid){

return reactionRepo.getReaction( token, eventtrigerid, queeid,  queestatus, imfgpid,cphid, previousevenid, orgid );
  }


}