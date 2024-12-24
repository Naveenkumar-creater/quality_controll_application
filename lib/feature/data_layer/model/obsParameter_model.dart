

import 'package:qc_control_app/feature/domain_layer/entity/obsparameter_entity.dart';

class ObsParameterModel extends ObsParameterEntity {
    ObsParameterModel({
        required this.observationBySamples,
    }) : super(observationBySamples:observationBySamples );

    final List<ObservationByParameter> observationBySamples;

    factory ObsParameterModel.fromJson(Map<String, dynamic> json){ 
        return ObsParameterModel(
            observationBySamples: json["response_data"]["Observation_By_Samples"] == null ? [] : List<ObservationByParameter>.from(json["response_data"]["Observation_By_Samples"]!.map((x) => ObservationByParameter.fromJson(x))),
        );
    }

}

class ObservationByParameter extends ObservationByParameterEntity{
    ObservationByParameter({
        required this.ipcIspUomId,
        required this.iqcIiId,
        required this.iqcIspDatatype,
        required this.iqcIiCpsId,
        required this.iqcIioIiId,
        required this.iqcIisId,
        required this.iqcIisIiqId,
        required this.iqcIspParamName,
        required this.iqcIioId,
        required this.iqcIioObservationStatus,
        required this.iqcCpsSpecType,
        required this.iqcCpsSpecDesc,
        required this.iqcIioObservationNotes,
        required this.iqcCpsRangeTo,
        required this.iqcCpsIspId,
        required this.iqcIioIisId,
        required this.iqcIioObservationNumericValue,
        required this.iqcCpsRangeFrom,
        required this.iqcIisSampleSno,
        required this.iqcIiIiqId,
        required this.iqcIioObservationTextValue,
        required this.iqcCpsValue,
    }) : super(ipcIspUomId: ipcIspUomId, iqcIiId: iqcIiId, iqcIspDatatype: iqcIspDatatype, iqcIiCpsId: iqcIiCpsId, iqcIioIiId: iqcIioIiId, iqcIisId: iqcIisId, iqcIisIiqId: iqcIisIiqId, iqcIspParamName: iqcIspParamName, iqcIioId: iqcIioId, iqcIioObservationStatus: iqcIioObservationStatus, iqcCpsSpecType: iqcCpsSpecType, iqcCpsSpecDesc: iqcCpsSpecDesc, iqcIioObservationNotes: iqcIioObservationNotes, iqcCpsRangeTo: iqcCpsRangeTo, iqcCpsIspId: iqcCpsIspId,
     iqcIioIisId: iqcIioIisId, iqcIioObservationNumericValue: iqcIioObservationNumericValue, iqcCpsRangeFrom: iqcCpsRangeFrom, iqcIisSampleSno: iqcIisSampleSno, iqcIiIiqId: iqcIiIiqId, iqcIioObservationTextValue: iqcIioObservationTextValue, iqcCpsValue: iqcCpsValue);

    final int? ipcIspUomId;
    final int? iqcIiId;
    final int? iqcIspDatatype;
    final int? iqcIiCpsId;
    final int? iqcIioIiId;
    final int? iqcIisId;
    final int? iqcIisIiqId;
    final String? iqcIspParamName;
    final int? iqcIioId;
    final int? iqcIioObservationStatus;
    final int? iqcCpsSpecType;
    final String? iqcCpsSpecDesc;
    final String? iqcIioObservationNotes;
    final int? iqcCpsRangeTo;
    final int? iqcCpsIspId;
    final int? iqcIioIisId;
    final int? iqcIioObservationNumericValue;
    final int? iqcCpsRangeFrom;
    final int? iqcIisSampleSno;
    final int? iqcIiIiqId;
    final String? iqcIioObservationTextValue;
    final int? iqcCpsValue;

    factory ObservationByParameter.fromJson(Map<String, dynamic> json){ 
        return ObservationByParameter(
            ipcIspUomId: json["ipc_isp_uom_id"],
            iqcIiId: json["iqc_ii_id"],
            iqcIspDatatype: json["iqc_isp_datatype"],
            iqcIiCpsId: json["iqc_ii_cps_id"],
            iqcIioIiId: json["iqc_iio_ii_id"],
            iqcIisId: json["iqc_iis_id"],
            iqcIisIiqId: json["iqc_iis_iiq_id"],
            iqcIspParamName: json["iqc_isp_param_name"],
            iqcIioId: json["iqc_iio_id"],
            iqcIioObservationStatus: json["iqc_iio_observation_status"],
            iqcCpsSpecType: json["iqc_cps_spec_type"],
            iqcCpsSpecDesc: json["iqc_cps_spec_desc"],
            iqcIioObservationNotes: json["iqc_iio_observation_notes"],
            iqcCpsRangeTo: json["iqc_cps_range_to"],
            iqcCpsIspId: json["iqc_cps_isp_id"],
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
