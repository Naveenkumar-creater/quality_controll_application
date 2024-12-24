class InspectionSampleLocalModel {
  InspectionSampleLocalModel(
      {required this.iqcIiqMaxSampleSize,
      required this.iqcIisSampleTag,
      required this.iqcIiqStatus,
      required this.imfgpPaId,
      required this.iqcIiqSampleUomId,
      required this.iqcIiqIieId,
      required this.iqciisId});

  final int? iqcIiqMaxSampleSize;
  final String? iqcIisSampleTag;
  final int? iqcIiqStatus;
  final int? imfgpPaId;
  final int? iqcIiqSampleUomId;
  final int? iqcIiqIieId;
  final int? iqciisId;

  Map<String, dynamic> toJson() => {
        "iqc_iiq_max_sample_size": iqcIiqMaxSampleSize,
        "iqc_iis_sample_tag": iqcIisSampleTag,
        "iqc_iiq_status": iqcIiqStatus,
        "imfgp_pa_id": imfgpPaId,
        "iqc_iiq_sample_uom_id": iqcIiqSampleUomId,
        "iqc_iiq_iie_id": iqcIiqIieId,
        "iqc_iis_id": iqciisId
      };
}
