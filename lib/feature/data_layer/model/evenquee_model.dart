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
    }) : super(iqcIiqDate: iqcIiqDate, pcCardNo: pcCardNo, imfgpPaId:imfgpPaId , mpmName: mpmName, iqcIiqSampleUomId: iqcIiqSampleUomId, itemName: itemName, pcItemCode: pcItemCode, iqcIiqIieId: iqcIiqIieId, iqcIiqMaxSampleSize:iqcIiqMaxSampleSize , pcItemId: pcItemId, paActivityName: paActivityName, 
    iqcIiqInspectionType: iqcIiqInspectionType, iqcIieAssetId: iqcIieAssetId, iqcIiqStatus: iqcIiqStatus, iqcIieCphId: iqcIieCphId, iqcIeEventName: iqcIeEventName, imfgpMpmId: imfgpMpmId, imfgpProcessSeq: imfgpProcessSeq, iqcIiqAssignedTo: iqcIiqAssignedTo, imfgpId: imfgpId);

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

    factory EventQueueList.fromJson(Map<String, dynamic> json){ 
        return EventQueueList(
            iqcIiqDate: DateTime.tryParse(json["iqc_iiq_date"] ?? ""),
            pcCardNo: json["pc_card_no"],
            imfgpPaId: json["imfgp_pa_id"],
            mpmName: json["mpm_name"],
            iqcIiqSampleUomId: json["iqc_iiq_sample_uom_id"],
            itemName: json["item_name"],
            pcItemCode: json["pc_item_code"],
            iqcIiqIieId: json["iqc_iiq_iie_id"],
            iqcIiqMaxSampleSize: json["iqc_iiq_max_sample_size"],
            pcItemId: json["pc_item_id"],
            paActivityName: json["pa_activity_name"],
            iqcIiqInspectionType: json["iqc_iiq_inspection_type"],
            iqcIieAssetId: json["iqc_iie_asset_id"],
            iqcIiqStatus: json["iqc_iiq_status"],
            iqcIieCphId: json["iqc_iie_cph_id"],
            iqcIeEventName: json["iqc_ie_event_name"],
            imfgpMpmId: json["imfgp_mpm_id"],
            imfgpProcessSeq: json["imfgp_process_seq"],
            iqcIiqAssignedTo: json["iqc_iiq_assigned_to"],
            imfgpId: json["imfgp_id"],
          
        );
    }

}
