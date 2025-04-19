class ReactionrequestModel {
    ReactionrequestModel({
        required this.clientAutToken,
        required this.apiFor,
        required this.reactionStatus,
        required this.eventTriggerId,
        required this.eventQueId,
        required this.nextEventid,
        required this.orgId,
        required this.pcId,
        required this.iqcIieAssetId,
        required this.iqcIieCphId,
        required this.eventId,
        required this.imfgpId,
        required this.overallNotes,
        required this.reactionData,
        required this.reactionId,
    });

    final String? clientAutToken;
    final String? apiFor;
    final int? reactionStatus;
    final int? eventTriggerId;
    final int? eventQueId;
    final int? nextEventid;
    final int? orgId;
    final int? pcId;
    final int? iqcIieAssetId;
    final int? iqcIieCphId;
    final int? eventId;
    final int? imfgpId;
    final String? overallNotes;
    final int ? reactionId;
    final List<ReactionData> reactionData;

    Map<String, dynamic> toJson() => {
        "client_aut_token": clientAutToken,
        "api_for": apiFor,
        "reaction_status": reactionStatus,
        "event_trigger_id": eventTriggerId,
        "event_que_id": eventQueId,
        "next_eventid": nextEventid,
        "org_id": orgId,
        "pc_id": pcId,
        "iqc_iie_asset_id": iqcIieAssetId,
        "iqc_iie_cph_id": iqcIieCphId,
        "event_id": eventId,
        "imfgp_id": imfgpId,
        "iqcIirId" : reactionId,
        "Overall_notes": overallNotes,
        "reaction_data": reactionData.map((x) => x.toJson()).toList(),
    };

}

class ReactionData {
    ReactionData({
        required this.reactionactionId,
        required this.actionStatus,
        required this.reactionNotes,
    });

    final int? reactionactionId;
    final int? actionStatus;
    final String? reactionNotes;

    Map<String, dynamic> toJson() => {
        "reaction_Id": reactionactionId,
        "action_status": actionStatus,
        "reaction_notes": reactionNotes,
    };

}



  // {
  //   "client_aut_token": clientAutToken,
  //       "api_for": apiFor,
  //       "reaction_status": reactionStatus,
  //       "event_trigger_id": eventTriggerId,
  //       "event_que_id": eventQueId,
  //       "next_eventid": nextEventid,
  //       "org_id": orgId,
  //       "pc_id": pcId,
  //       "iqc_iie_asset_id": iqcIieAssetId,
  //       "iqc_iie_cph_id": iqcIieCphId,
  //       "event_id": eventId,
  //       "imfgp_id": imfgpId,
  //       "iqcIirId" : reactionId,
  //       "Overall_notes": overallNotes,
  // }