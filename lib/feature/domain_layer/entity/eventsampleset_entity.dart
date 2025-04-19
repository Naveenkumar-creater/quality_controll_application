import 'package:equatable/equatable.dart';

class EventsampleSetEntity extends Equatable {
    const EventsampleSetEntity({
        required this.listOfSamplesSet,
    });

    final List<ListOfSamplesSetEntity> listOfSamplesSet;


    @override
    List<Object?> get props => [
    listOfSamplesSet];
}

class ListOfSamplesSetEntity extends Equatable {

    ListOfSamplesSetEntity({
        required this.iqcIishIiqId,
        required this.userId,
        required this.orgId,
        required this.iqcIishSampleBatchNo,
        required this.iqcIishId,
        required this.status,
         required this.samplesize,
         required this.iqciiqproductionqty,
          required this.samplesetstatuscount
    });

    final int? iqcIishIiqId;
    final int? userId;
    final int? orgId;
    final String? iqcIishSampleBatchNo;
    final int? iqcIishId;
    final int? status;
    final int ? samplesize;
    final int? iqciiqproductionqty;
    final int? samplesetstatuscount;
    
    


    @override
    List<Object?> get props => [
    iqcIishIiqId, userId, orgId, iqcIishSampleBatchNo, iqcIishId, status, iqciiqproductionqty];
}
