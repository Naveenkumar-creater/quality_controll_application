import 'package:qc_control_app/feature/domain_layer/entity/reaction_entity.dart';

abstract  class ReactionRepo {

Future<ReactionEntity> getReaction(String token, int eventriggerid, int queeid, int queestatus, int imfgpid, int cphid,int previousevenid, int orgid);

}   