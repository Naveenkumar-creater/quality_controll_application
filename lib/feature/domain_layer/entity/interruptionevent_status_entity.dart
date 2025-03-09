import 'package:equatable/equatable.dart';

class ListInterruptionEventEntity extends Equatable {
    ListInterruptionEventEntity({
        required this.listOfInterruptionEvent,
    });

    final List<ListOfInterruptionEvents> listOfInterruptionEvent;



    @override
    List<Object?> get props => [
    listOfInterruptionEvent, ];
}

class ListOfInterruptionEvents extends Equatable {
    ListOfInterruptionEvents({
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
    });

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


    @override
    List<Object?> get props => [
    iqcCppeCppId, nextEventName, iqcCppeFrequency, iqcCppeIeId, iqcIeEventType, iqcCppeNextIeId, eventType, iqcCppeId, userId, orgId, iqcCppeFrequencyUomId, eventName, iqcCppeSeqNo, status, ];
}