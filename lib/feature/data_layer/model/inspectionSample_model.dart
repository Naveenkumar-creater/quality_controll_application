import 'package:qc_control_app/feature/domain_layer/entity/inspectionsample_entity.dart';

class InspectionSampleModel extends InspectionSampleEntity {
    InspectionSampleModel({
        required this.listOfSamples,
    }):super(listOfSamplesEntity: listOfSamples);

    final List<ListOfSample> listOfSamples;

    factory InspectionSampleModel.fromJson(Map<String, dynamic> json){ 
        return InspectionSampleModel(
            listOfSamples: json["response_data"]["List_Of_Samples"] == null ? [] : List<ListOfSample>.from(json["response_data"]["List_Of_Samples"]!.map((x) => ListOfSample.fromJson(x))),
        );
    }

}

class ListOfSample extends ListOfSampleEntity {
    ListOfSample({
        required this.iqcIiqMaxSampleSize,
        required this.iqcIisSampleTag,
        required this.iqcIiqStatus,
        required this.imfgpPaId,
        required this.iqcIiqSampleUomId,
        required this.iqcIiqIieId,
        required this.iqciisId
    }):super(imfgpPaId:imfgpPaId ,iqcIiqIieId: iqcIiqIieId,iqcIiqMaxSampleSize:iqcIiqMaxSampleSize ,
    iqcIiqSampleUomId: iqcIiqSampleUomId,iqcIiqStatus:iqcIiqStatus ,iqcIisSampleTag:iqcIisSampleTag, iqciisId:iqciisId);

    final int? iqcIiqMaxSampleSize;
    final String? iqcIisSampleTag;
    final int? iqcIiqStatus;
    final int? imfgpPaId;
    final int? iqcIiqSampleUomId;
    final int? iqcIiqIieId;
    final int? iqciisId;

    factory ListOfSample.fromJson(Map<String, dynamic> json){ 
        return ListOfSample(
            iqcIiqMaxSampleSize: json["iqc_iiq_max_sample_size"],
            iqcIisSampleTag: json["iqc_iis_sample_tag"],
            iqcIiqStatus: json["iqc_iiq_status"],
            imfgpPaId: json["imfgp_pa_id"],
            iqcIiqSampleUomId: json["iqc_iiq_sample_uom_id"],
            iqcIiqIieId: json["iqc_iiq_iie_id"],
            iqciisId:json["iqc_iis_id"]
        );
    }

}
