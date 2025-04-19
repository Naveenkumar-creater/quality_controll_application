

class EventsamplesetdatalocalModel {
    EventsamplesetdatalocalModel({
        required this.iqcIishIiqId,
        required this.userId,
        required this.orgId,
        required this.iqcIishSampleBatchNo,
        required this.iqcIishId,
        required this.status,
        required this.productionqty,
        required this.samplesetindex
    });

    final int? iqcIishIiqId;
    final int? userId;
    final int? orgId;
    final String? iqcIishSampleBatchNo;
    final int? iqcIishId;
    final int? status;
    final double? productionqty;
    final int ? samplesetindex;

    factory EventsamplesetdatalocalModel.fromJson(Map<String, dynamic> json){ 
        return EventsamplesetdatalocalModel(
            iqcIishIiqId: json["iqc_iish_iiq_id"],
            userId: json["user_id"],
            orgId: json["org_id"],
            iqcIishSampleBatchNo: json["iqc_iish_sample_batch_no"],
            iqcIishId: json["iqc_iish_id"],
            status: json["status"],
            productionqty:json["production_qty"],
            samplesetindex:json["sampleset_index"]
        );
    }

    Map<String, dynamic> toJson() => {
        "iqc_iish_iiq_id": iqcIishIiqId,
        "user_id": userId,
        "org_id": orgId,
        "iqc_iish_sample_batch_no": iqcIishSampleBatchNo,
        "iqc_iish_id": iqcIishId,
        "status": status,
        "production_qty":productionqty,
        "sampleset_index":samplesetindex
    };

}
