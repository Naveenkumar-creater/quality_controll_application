import 'package:qc_control_app/feature/domain_layer/entity/listofrestart_entity.dart';

class ListofRestartEventModel extends ListofRestartEventEntity{
    ListofRestartEventModel({
        required this.listOfNormalEvent,
    }):super(listOfNormalEvent: listOfNormalEvent);

    final List<ListOfNormalEventModel> listOfNormalEvent;

    factory ListofRestartEventModel.fromJson(Map<String, dynamic> json){ 
        return ListofRestartEventModel(
            listOfNormalEvent: json["response_data"]["list_of_normal_event"] == null ? [] : List<ListOfNormalEventModel>.from(json["response_data"]["list_of_normal_event"]!.map((x) => ListOfNormalEventModel.fromJson(x))),
        );
    }

}

class ListOfNormalEventModel  extends ListOfNormalEventEntity {
    ListOfNormalEventModel({
        required this.iqcCppeCppId,
        required this.iqcCppeFrequency,
        required this.iqcCppeIeId,
        required this.iqcIeEventType,
        required this.iqcCppeNextIeId,
        required this.eventType,
        required this.iqcCppeId,
        required this.userId,
        required this.orgId,
        required this.iqcCppeFrequencyUomId,
        required this.eventName,
        required this.uomName,
        required this.iqcCppeSeqNo,
        required this.status,
        required this.nextEventName,
    }):super(eventName:eventName ,eventType: eventName,iqcCppeCppId:iqcCppeCppId ,iqcCppeFrequency:iqcCppeFrequency ,iqcCppeFrequencyUomId: iqcCppeFrequencyUomId,iqcCppeId: iqcCppeId,
    iqcCppeIeId:iqcCppeIeId ,iqcCppeNextIeId:iqcCppeNextIeId ,iqcCppeSeqNo:iqcCppeSeqNo ,iqcIeEventType:iqcIeEventType ,nextEventName: nextEventName,orgId: orgId,status:status ,uomName:uomName ,userId: userId);

    final int? iqcCppeCppId;
    final int? iqcCppeFrequency;
    final int? iqcCppeIeId;
    final int? iqcIeEventType;
    final int? iqcCppeNextIeId;
    final String? eventType;
    final int? iqcCppeId;
    final int? userId;
    final int? orgId;
    final int? iqcCppeFrequencyUomId;
    final String? eventName;
    final String? uomName;
    final int? iqcCppeSeqNo;
    final int? status;
    final String? nextEventName;

    factory ListOfNormalEventModel.fromJson(Map<String, dynamic> json){ 
        return ListOfNormalEventModel(
            iqcCppeCppId: json["iqc_cppe_cpp_id"],
            iqcCppeFrequency: json["iqc_cppe_frequency"],
            iqcCppeIeId: json["iqc_cppe_ie_id"],
            iqcIeEventType: json["iqc_ie_event_type"],
            iqcCppeNextIeId: json["iqc_cppe_next_ie_id"],
            eventType: json["event_type"],
            iqcCppeId: json["iqc_cppe_id"],
            userId: json["user_id"],
            orgId: json["org_id"],
            iqcCppeFrequencyUomId: json["iqc_cppe_frequency_uom_id"],
            eventName: json["event_name"],
            uomName: json["uom_name"],
            iqcCppeSeqNo: json["iqc_cppe_seq_no"],
            status: json["status"],
            nextEventName: json["next_event_name"],
        );
    }

}
