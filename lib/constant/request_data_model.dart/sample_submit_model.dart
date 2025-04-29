class SampleSubmitModel {
    SampleSubmitModel({
        required this.clientAutToken,
        required this.apiFor,
        required this.eventStatus,
        required this.nexteventId,
        required this.eventtype,
        required this.eventQueId,
        required this.eventTriggerId,
        required this.orgid,
        required this.assetId,
        required this.headerId,
        required this.pccardid,
        required this.eventid,
        required this.inspectionStatus,
        required this.imfgpid,
        required this.listOfsampledata,
        required this.activityid,
        required this.processStatus,
        required this.itemid
    });

    final String? clientAutToken;
    final String? apiFor;
    final int? eventStatus;
    final int? eventTriggerId;
    final int? eventQueId;
    final int? nexteventId;
    final int  ? eventtype;
    final int ? orgid;
    final int? pccardid;
    final int? assetId;
    final int? headerId;
    final int? eventid;
    final int ? inspectionStatus;
    final int ? imfgpid;
    final int ? activityid;
    final int ? processStatus;
    final int ? itemid;
    final List<ListSampledata>? listOfsampledata;

    Map<String, dynamic> toJson() => {
        "client_aut_token": clientAutToken,
        "api_for": apiFor,
        "event_status": eventStatus,
        "event_trigger_id":eventTriggerId,
        "event_que_id":eventQueId,
         "next_eventid":nexteventId,
         "nextevent_type":eventtype,
        "org_id":orgid,
        "pc_id":pccardid,
       "iqc_iie_asset_id":assetId,
        "iqc_iie_cph_id" : headerId,
        "event_id" : eventid,
       "inspection_status" : inspectionStatus,
       "imfgp_id":imfgpid,
       "activity_id":activityid,
       "process_status":processStatus,
       "item_id":itemid,
       "sample_data": listOfsampledata?.map((listOfsampledata) => listOfsampledata.toJson()).toList(),
    };

}

class ListSampledata {
    ListSampledata({
        required this.sampleId,
        required this.cavityValue,

    });

    final int? sampleId;
    final String? cavityValue;

    Map<String, dynamic> toJson() => {
        "iqc_iis_Id": sampleId,
        "cavity_value": cavityValue,
      
    };

}


