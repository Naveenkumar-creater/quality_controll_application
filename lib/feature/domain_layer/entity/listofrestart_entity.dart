import 'package:equatable/equatable.dart';

class ListofRestartEventEntity extends Equatable {
    ListofRestartEventEntity({
        required this.listOfNormalEvent,
    });

    final List<ListOfNormalEventEntity> listOfNormalEvent;



    @override
    List<Object?> get props => [
    listOfNormalEvent, ];
}

class ListOfNormalEventEntity extends Equatable {
    ListOfNormalEventEntity({
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
    });

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


    @override
    List<Object?> get props => [
    iqcCppeCppId, iqcCppeFrequency, iqcCppeIeId, iqcIeEventType, iqcCppeNextIeId, eventType, iqcCppeId, userId, orgId, iqcCppeFrequencyUomId, eventName, uomName, iqcCppeSeqNo, status, nextEventName, ];
}
