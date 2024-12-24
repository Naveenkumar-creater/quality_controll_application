

import 'package:qc_control_app/feature/domain_layer/entity/obs_sample_entity.dart';

class ObsSampleModel extends ObsSampleEntity{
    ObsSampleModel({
        required this.observationBySamples,
    }) : super(observationBySampleEntity: observationBySamples);

    final List<ObservationBySample> observationBySamples;

    factory ObsSampleModel.fromJson(Map<String, dynamic> json){ 
        return ObsSampleModel(
            observationBySamples: json["response_data"]["Observation_By_Samples"] == null ? [] : List<ObservationBySample>.from(json["response_data"]["Observation_By_Samples"]!.map((x) => ObservationBySample.fromJson(x))),
        );
    }

}

class ObservationBySample extends ObservationBySampleEntity{
    ObservationBySample({
         required this.iqcIisSampleTag,
        required this.iqcIiId,
        required this.iqcIisId,
        required this.iqcIisIiqId,
        required this.iqcIiCpsId,
        required this.iqcIioIiId,
        required this.iqcIioId,
        required this.iqcIioObservationStatus,
        required this.iqcCpsSpecType,
        required this.iqcIioObservationNotes,
        required this.iqcCpsRangeTo,
        required this.iqcIioIisId,
        required this.iqcIioObservationNumericValue,
        required this.iqcCpsRangeFrom,
        required this.iqcIisSampleSno,
        required this.iqcIiIiqId,
        required this.iqcIioObservationTextValue,
        required this.iqcCpsValue,
    }) : super(iqcCpsRangeFrom:iqcCpsRangeFrom ,iqcCpsRangeTo:iqcCpsRangeTo ,iqcCpsSpecType: iqcCpsSpecType,
    iqcCpsValue: iqcCpsValue,iqcIioObservationNotes:iqcIioObservationNotes ,iqcIioObservationTextValue: iqcIioObservationTextValue,
      iqcIisSampleTag: iqcIisSampleTag, iqcIiId: iqcIiId, 
      iqcIioIisId: iqcIioIisId, iqcIisId: iqcIisId, iqcIisIiqId: iqcIisIiqId, 
      iqcIiCpsId: iqcIiCpsId, iqcIioIiId: iqcIioIiId, iqcIioObservationNumericValue: iqcIioObservationNumericValue, iqcIisSampleSno: iqcIisSampleSno, 
      iqcIiIiqId: iqcIiIiqId, iqcIioId: iqcIioId, iqcIioObservationStatus: iqcIioObservationStatus);

  final String? iqcIisSampleTag;
    final int? iqcIiId;
    final int? iqcIisId;
    final int? iqcIisIiqId;
    final int? iqcIiCpsId;
    final int? iqcIioIiId;
    final int? iqcIioId;
    final int? iqcIioObservationStatus;
    final int? iqcCpsSpecType;
    final String? iqcIioObservationNotes;
    final int? iqcCpsRangeTo;
    final int? iqcIioIisId;
    final int? iqcIioObservationNumericValue;
    final int? iqcCpsRangeFrom;
    final int? iqcIisSampleSno;
    final int? iqcIiIiqId;
    final String? iqcIioObservationTextValue;
    final int? iqcCpsValue;

    factory ObservationBySample.fromJson(Map<String, dynamic> json){ 
        return ObservationBySample(
         iqcIisSampleTag: json["iqc_iis_sample_tag"],
            iqcIiId: json["iqc_ii_id"],
            iqcIisId: json["iqc_iis_id"],
            iqcIisIiqId: json["iqc_iis_iiq_id"],
            iqcIiCpsId: json["iqc_ii_cps_id"],
            iqcIioIiId: json["iqc_iio_ii_id"],
            iqcIioId: json["iqc_iio_id"],
            iqcIioObservationStatus: json["iqc_iio_observation_status"],
            iqcCpsSpecType: json["iqc_cps_spec_type"],
            iqcIioObservationNotes: json["iqc_iio_observation_notes"],
            iqcCpsRangeTo: json["iqc_cps_range_to"],
            iqcIioIisId: json["iqc_iio_iis_id"],
            iqcIioObservationNumericValue: json["iqc_iio_observation_numeric_value"],
            iqcCpsRangeFrom: json["iqc_cps_range_from"],
            iqcIisSampleSno: json["iqc_iis_sample_sno"],
            iqcIiIiqId: json["iqc_ii_iiq_id"],
            iqcIioObservationTextValue: json["iqc_iio_observation_text_value"],
            iqcCpsValue: json["iqc_cps_value"],
        );
    }

}
