import 'package:qc_control_app/feature/domain_layer/entity/eventquee_entity.dart';

class EventQueeModel extends EventQueeEntity {
    EventQueeModel({
        required this.eventQueueList,
    }):super(eventQueueListEntity: eventQueueList);

    final List<EventQueueList> eventQueueList;

    factory EventQueeModel.fromJson(Map<String, dynamic> json){ 
        return EventQueeModel(
            eventQueueList: json["response_data"]["Event_Queue_List"] == null ? [] : List<EventQueueList>.from(json["response_data"]["Event_Queue_List"]!.map((x) => EventQueueList.fromJson(x))),
        );
    }
}


class EventQueueList extends EventQueueListEntity{
    EventQueueList({
    required this.iqcIiqDate,
        required this.imfgpPaId,
        required this.mpmName,
        required this.pcItemCode,
        required this.iqcIiqIieId,
        required this.iqcIiqId,
        required this.iqcIieIeId,
        required this.paActivityName,
        required this.iqcIieAssetId,
        required this.assetName,
        required this.iqcIiqStatus,
        required this.iqcIieCphId,
        required this.iqcIeEventName,
        required this.iqcIieId,
        required this.pcCardNo,
        required this.iqcIiqSampleUomId,
        required this.itemName,
        required this.iqcIiqMaxSampleSize,
        required this.pcItemId,
        required this.iqcIiqInspectionType,
        required this.imfgpMpmId,
        required this.imfgpProcessSeq,
        required this.paId,
        required this.iqcIiqAssignedTo,
        required this.imfgpId,
        required this.statusName,
        required this.natureEvent,
        required this.pcid,
        required this.previouseventid,
        required this.cavityflag,
        required this.iqcpreviousid
    }) : super(
      iqcpreviousid: iqcpreviousid,
      assetName: assetName,iqcIieId:iqcIieId ,iqcIieIeId: iqcIieIeId,iqcIiqId:iqcIiqId ,paId:paId ,
      iqcIiqDate: iqcIiqDate, pcCardNo: pcCardNo, imfgpPaId:imfgpPaId , mpmName: mpmName, iqcIiqSampleUomId: iqcIiqSampleUomId, itemName: itemName, pcItemCode: pcItemCode, iqcIiqIieId: iqcIiqIieId, iqcIiqMaxSampleSize:iqcIiqMaxSampleSize , pcItemId: pcItemId, paActivityName: paActivityName, 
    iqcIiqInspectionType: iqcIiqInspectionType, iqcIieAssetId: iqcIieAssetId, iqcIiqStatus: iqcIiqStatus, iqcIieCphId: iqcIieCphId, iqcIeEventName: iqcIeEventName, imfgpMpmId: imfgpMpmId, imfgpProcessSeq: imfgpProcessSeq, iqcIiqAssignedTo: iqcIiqAssignedTo, imfgpId: imfgpId, 
     statusName: statusName, natureEvent: natureEvent, pcid: pcid,
     previouseventid: previouseventid
, cavityflag: cavityflag    );


     final DateTime? iqcIiqDate;
    final int? imfgpPaId;
    final String? mpmName;
    final String? pcItemCode;
    final int? iqcIiqIieId;
    final int? iqcIiqId;
    final int? iqcIieIeId;
    final String? paActivityName;
    final int? iqcIieAssetId;
    final String? assetName;
    final int? iqcIiqStatus;
    final int? iqcIieCphId;
    final String? iqcIeEventName;
    final int? iqcIieId;
    final String? pcCardNo;
    final int? iqcIiqSampleUomId;
    final String? itemName;
    final int? iqcIiqMaxSampleSize;
    final int? pcItemId;
    final int? iqcIiqInspectionType;
    final int? imfgpMpmId;
    final int? imfgpProcessSeq;
    final int? paId;
    final int? iqcIiqAssignedTo;
    final int? imfgpId;
    final String ? statusName;
    final int? natureEvent;
    final int ? pcid;
    final int ? previouseventid;
    final int ? cavityflag;
    final int ? iqcpreviousid;


    factory EventQueueList.fromJson(Map<String, dynamic> json){ 
        return EventQueueList(
             iqcIiqDate: DateTime.tryParse(json["iqc_iiq_date"] ?? ""),
            imfgpPaId: json["imfgp_pa_id"],
            mpmName: json["mpm_name"],
            pcItemCode: json["pc_item_code"],
            iqcIiqIieId: json["iqc_iiq_iie_id"],
            iqcIiqId: json["iqc_iiq_id"],
            iqcIieIeId: json["iqc_iie_ie_id"],
            paActivityName: json["pa_activity_name"],
            iqcIieAssetId: json["iqc_iie_asset_id"],
            assetName: json["asset_name"],
            iqcIiqStatus: json["iqc_iiq_status"],
            iqcIieCphId: json["iqc_iie_cph_id"],
            iqcIeEventName: json["iqc_ie_event_name"],
            iqcIieId: json["iqc_iie_id"],
            pcCardNo: json["pc_card_no"],
            iqcIiqSampleUomId: json["iqc_iiq_sample_uom_id"],
            itemName: json["item_name"],
            iqcIiqMaxSampleSize: json["iqc_iiq_max_sample_size"],
            pcItemId: json["pc_item_id"],
            iqcIiqInspectionType: json["iqc_iiq_inspection_type"],
            imfgpMpmId: json["imfgp_mpm_id"],
            imfgpProcessSeq: json["imfgp_process_seq"],
            paId: json["pa_id"],
            iqcIiqAssignedTo: json["iqc_iiq_assigned_to"],
            imfgpId: json["imfgp_id"],  
            statusName:json["status_name"],
            natureEvent:json["iqc_ie_nature_of_event"],
           pcid:  json['iqc_iie_pc_id'],
         previouseventid:  json["iqc_iie_prev_iie_id"],
         cavityflag: json["mpm_cavity_flag"],
         iqcpreviousid: json["iqc_iie_prev_iie_id"]
        );
    }

}
