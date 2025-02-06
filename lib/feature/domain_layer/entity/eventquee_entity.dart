

import 'package:equatable/equatable.dart';

class EventQueeEntity extends Equatable{
    EventQueeEntity({
        required this.eventQueueListEntity,
    });

    final List<EventQueueListEntity> eventQueueListEntity;
    
      @override
      // TODO: implement props
      List<Object?> get props => [eventQueueListEntity];


}

class EventQueueListEntity extends Equatable {
    EventQueueListEntity({
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
        required this.assetName
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
    final String ? assetName;
    
      @override
      // TODO: implement props
      List<Object?> get props => [
      iqcIiqDate,
     pcCardNo,
      imfgpPaId,
     mpmName,
      iqcIiqSampleUomId,
     itemName,
     pcItemCode,
      iqcIiqIieId,
      iqcIiqMaxSampleSize,
      pcItemId,
     paActivityName,
      iqcIiqInspectionType,
      iqcIieAssetId,
      iqcIiqStatus,
      iqcIieCphId,
     iqcIeEventName,
      imfgpMpmId,
      imfgpProcessSeq,
      iqcIiqAssignedTo,
      imfgpId,
      assetName
      ];


}
