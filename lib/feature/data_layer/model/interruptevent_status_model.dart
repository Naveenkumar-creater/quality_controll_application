import 'package:qc_control_app/feature/domain_layer/entity/interruptionevent_status_entity.dart';

class ListInterruptionEventModel extends ListInterruptionEventEntity {
    ListInterruptionEventModel({
        required this.listOfInterruptionEvent,
    }):super(listOfInterruptionEvent: listOfInterruptionEvent);

    final List<ListOfInterruptionEvent> listOfInterruptionEvent;

    factory ListInterruptionEventModel.fromJson(Map<String, dynamic> json){ 
        return ListInterruptionEventModel(
            listOfInterruptionEvent: json["response_data"]["list_of_interruption_event"] == null ? [] : List<ListOfInterruptionEvent>.from(json["response_data"]["list_of_interruption_event"]!.map((x) => ListOfInterruptionEvent.fromJson(x))),
        );
    }

}

class ListOfInterruptionEvent extends ListOfInterruptionEvents {
    ListOfInterruptionEvent({
        required this.iqcCppeCppId,
        required this.nextEventName,
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
        required this.iqcCppeSeqNo,
        required this.status,
    }):super(eventName: eventName,eventType:eventType ,iqcCppeCppId: iqcCppeCppId,iqcCppeFrequency: iqcCppeFrequency,iqcCppeFrequencyUomId:iqcCppeFrequencyUomId ,iqcCppeId:iqcCppeId ,iqcCppeIeId:iqcCppeIeId ,
    iqcCppeNextIeId:iqcCppeNextIeId ,iqcCppeSeqNo: iqcCppeSeqNo
    ,iqcIeEventType:iqcIeEventType ,nextEventName: nextEventName,orgId:orgId ,
    status: status,userId:userId );

    final int? iqcCppeCppId;
    final String? nextEventName;
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
    final int? iqcCppeSeqNo;
    final int? status;

    factory ListOfInterruptionEvent.fromJson(Map<String, dynamic> json){ 
        return ListOfInterruptionEvent(
            iqcCppeCppId: json["iqc_cppe_cpp_id"],
            nextEventName: json["next_event_name"],
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
            iqcCppeSeqNo: json["iqc_cppe_seq_no"],
            status: json["status"],
        );
    }

}
