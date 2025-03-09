class EventQueuelocalDataModel {
  EventQueuelocalDataModel({
    required this.iqcIiqDate,
    required this.pcCardNo,
    required this.imfgpPaId,
    required this.mpmName,
    required this.iqcIiqSampleUomId,
    required this.itemName,
    required this.pcItemCode,
    required this.iqcIiqIieId,
    required this.iqcIiqMaxSampleSize,
    required this.pcItemId,
    required this.paActivityName,
    required this.iqcIiqInspectionType,
    required this.iqcIieAssetId,
    required this.iqcIiqStatus,
    required this.iqcIieCphId,
    required this.iqcIeEventName,
    required this.imfgpMpmId,
    required this.imfgpProcessSeq,
    required this.iqcIiqAssignedTo,
    required this.imfgpId,
    required this.iqcIiqId,
    required this.natureEvent,
    required this.pcid,
    required this.iqcIieIeId,
    required this.previouseventid
  });


  final DateTime? iqcIiqDate;
  final String? pcCardNo;
  final int? imfgpPaId;
  final String? mpmName;
  final int? iqcIiqSampleUomId;
  final String? itemName;
  final String? pcItemCode;
  final int? iqcIiqIieId;
  final int? iqcIiqMaxSampleSize;
  final int? pcItemId;
  final String? paActivityName;
  final int? iqcIiqInspectionType;
  final int? iqcIieAssetId;
  final int? iqcIiqStatus;
  final int? iqcIieCphId;
  final String? iqcIeEventName;
  final int? imfgpMpmId;
  final int? imfgpProcessSeq;
  final int? iqcIiqAssignedTo;
  final int? imfgpId;
  final int? iqcIiqId;
  final int ? natureEvent;
  final int? pcid;
  final int ? iqcIieIeId;
  final int ? previouseventid;

  
  Map<String, dynamic> toJson() => {
        "iqc_iiq_date": iqcIiqDate,
       "iqc_iiq_id":iqcIiqId,
        "pc_card_no": pcCardNo,
        "imfgp_pa_id": imfgpPaId,
        "mpm_name": mpmName,
        "iqc_iiq_sample_uom_id": iqcIiqSampleUomId,
        "item_name": itemName,
        "pc_item_code": pcItemCode,
        "iqc_iiq_iie_id": iqcIiqIieId,
        "iqc_iiq_max_sample_size": iqcIiqMaxSampleSize,
        "pc_item_id": pcItemId,
        "pa_activity_name": paActivityName,
        "iqc_iiq_inspection_type": iqcIiqInspectionType,
        "iqc_iie_asset_id": iqcIieAssetId,
        "iqc_iiq_status": iqcIiqStatus,
        "iqc_iie_cph_id": iqcIieCphId,
        "iqc_ie_event_name": iqcIeEventName,
        "imfgp_mpm_id": imfgpMpmId,
        "imfgp_process_seq": imfgpProcessSeq,
        "iqc_iiq_assigned_to": iqcIiqAssignedTo,
        "imfgp_id": imfgpId,
       "iqc_ie_nature_of_event": natureEvent,
        "iqc_iie_pc_id" : pcid,
      "iqc_iie_ie_id" :  iqcIieIeId,
"iqc_iie_prev_iie_id" : previouseventid 
      };
}
