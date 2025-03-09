import 'package:equatable/equatable.dart';

class ReactionEntity extends Equatable {
   const  ReactionEntity({
        required this.listOfReaction,
    });

    final List<ListOfReactionEntity> listOfReaction;

    @override
    List<Object?> get props => [
    listOfReaction, ];
}

class ListOfReactionEntity extends Equatable {
    ListOfReactionEntity({
        required this.iqcIraCpfrId,
        required this.iqcIirActionEndTime,
        required this.iqcIraResponsibleDept,
        required this.iqcIirLineStatus,
        required this.iqcIraActionNotes,
        required this.iqcIirDate,
        required this.iqcIspParamName,
        required this.iqcIirId,
        required this.iqcIraStartDate,
        required this.iqcIraActionAssignedTo,
        required this.iqcIirIieId,
        required this.iqcIraEndDate,
        required this.iqcIirActionStatus,
        required this.iqcIraIirId,
        required this.iqcIirActionStartTime,
        required this.iqcIraIiqId,
        required this.iqcCrpReactionDesc,
        required this.iqcIraActionStatus,
        required this.iqcCrpSeq,
        required this.iqcIirLineProdOutputStatus,
        required this.iqcIraId,
    });

    final int? iqcIraCpfrId;
    final DateTime? iqcIirActionEndTime;
    final int? iqcIraResponsibleDept;
    final int? iqcIirLineStatus;
    final String? iqcIraActionNotes;
    final DateTime? iqcIirDate;
    final String? iqcIspParamName;
    final int? iqcIirId;
    final DateTime? iqcIraStartDate;
    final int? iqcIraActionAssignedTo;
    final int? iqcIirIieId;
    final DateTime? iqcIraEndDate;
    final int? iqcIirActionStatus;
    final int? iqcIraIirId;
    final DateTime? iqcIirActionStartTime;
    final int? iqcIraIiqId;
    final String? iqcCrpReactionDesc;
    final int? iqcIraActionStatus;
    final int? iqcCrpSeq;
    final int? iqcIirLineProdOutputStatus;
    final int? iqcIraId;

    

    @override
    List<Object?> get props => [
    iqcIraCpfrId, iqcIirActionEndTime, iqcIraResponsibleDept, iqcIirLineStatus, iqcIraActionNotes, iqcIirDate, iqcIspParamName, iqcIirId, iqcIraStartDate, iqcIraActionAssignedTo, iqcIirIieId, iqcIraEndDate, iqcIirActionStatus, iqcIraIirId, iqcIirActionStartTime, iqcIraIiqId, iqcCrpReactionDesc, iqcIraActionStatus, iqcCrpSeq, iqcIirLineProdOutputStatus, iqcIraId, ];
}
