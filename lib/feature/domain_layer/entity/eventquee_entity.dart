

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
    });

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
    final String? statusName;
    final int? natureEvent;
    final int? pcid;
    final int ? previouseventid;
    final int ? cavityflag;
    final int? iqcpreviousid;
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
      assetName,
      natureEvent,
      previouseventid
      ];


}
