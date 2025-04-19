import 'package:qc_control_app/feature/domain_layer/entity/eventsampleset_entity.dart';

class EventSampleSetModel extends EventsampleSetEntity{

    EventSampleSetModel({
        required this.listOfSamplesSet,
    }) : super(listOfSamplesSet: listOfSamplesSet);

    final List<ListOfSamplesSet> listOfSamplesSet;

    factory EventSampleSetModel.fromJson(Map<String, dynamic> json){ 
        return EventSampleSetModel(
            listOfSamplesSet: json ["response_data"]["List_Of_Samples_Set"] == null ? [] : List<ListOfSamplesSet>.from(json["response_data"]["List_Of_Samples_Set"]!.map((x) => ListOfSamplesSet.fromJson(x))),
        );
    }

}

class ListOfSamplesSet extends ListOfSamplesSetEntity {
    ListOfSamplesSet({
        required this.iqcIishIiqId,
        required this.userId,
        required this.orgId,
        required this.iqcIishSampleBatchNo,
        required this.iqcIishId,
        required this.status,
        required this.samplesize,
        required this.iqciiqproductionqty,
        required this.samplesetstatuscount
    }):super(
      samplesetstatuscount: samplesetstatuscount,
      iqciiqproductionqty:iqciiqproductionqty ,
      samplesize: samplesize,
      iqcIishId: iqcIishId,iqcIishIiqId:iqcIishIiqId ,iqcIishSampleBatchNo: iqcIishSampleBatchNo,orgId: orgId,status:status ,userId: userId);

    final int? iqcIishIiqId;
    final int? userId;
    final int? orgId;
    final String? iqcIishSampleBatchNo;
    final int? iqcIishId;
    final int? status;
    final int? samplesize;
    final int? iqciiqproductionqty;
    final int ? samplesetstatuscount;

    factory ListOfSamplesSet.fromJson(Map<String, dynamic> json) { 
        return ListOfSamplesSet(
            iqcIishIiqId: json["iqc_iish_iiq_id"],
            userId: json["user_id"],
            orgId: json["org_id"],
            iqcIishSampleBatchNo: json["iqc_iish_sample_batch_no"],
            iqcIishId: json["iqc_iish_id"],
            status: json["status"],
            samplesize:json["iqc_iish_sample_size"],
           iqciiqproductionqty : json["iqc_iiq_production_qty"],
           samplesetstatuscount:json["status_count"]
        );
    }

}
