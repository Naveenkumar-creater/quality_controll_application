

import 'package:qc_control_app/feature/domain_layer/entity/inspectionparameter_entity.dart';

class InspectionParameterModel extends InspectionParameterEntity {
    InspectionParameterModel({
        required this.specificationParameters,
    }):super(specificationParameterEntity:specificationParameters );

    final List<SpecificationParameter> specificationParameters;

    factory InspectionParameterModel.fromJson(Map<String, dynamic> json){ 
        return InspectionParameterModel(
            specificationParameters: json ["response_data"] ["Specification_parameters"] == null ? [] : List<SpecificationParameter>.from(json ["response_data"]["Specification_parameters"]!.map((x) => SpecificationParameter.fromJson(x))),
        );
    }

}

class SpecificationParameter extends SpecificationParameterEntity {
    SpecificationParameter({
         required this.ipcIspUomId,
        required this.iqcIiId,
        required this.iqcCpeId,
        required this.iqcCmMethodName,
        required this.iqcCmMethodDesc,
        required this.iqcIspParamName,
        required this.iqcCpcmSampleUomId,
        required this.iqcIiSampleUomId,
        required this.iqcIiObsStatus,
        required this.iqcCpeEvalTechnique,
        required this.iqcCpeMtAssetTypeId,
        required this.iqcIiInspectionBy,
        required this.iqcCpsRangeFrom,
        required this.iqcIspIsgId,
        required this.iqcCpsValue,
        required this.iqcIspDatatype,
        required this.iqcCpsSeq,
        required this.iqcIspAssetSpecId,
        required this.iqcCmMethodType,
        required this.iqcIiInspectionStatus,
        required this.iqcCpsImfgpId,
        required this.iqcCpcmResponsibility,
        required this.iqcCpsSpecType,
        required this.iqcCpsIspId,
        required this.iqcCpsRangeTo,
        required this.iqcIiSampleSize,
        required this.iqcCpcmId,
        required this.iqcIspId,
        required this.iqcCpsAssetType,
    }):super(
      iqcCmMethodDesc:iqcCmMethodDesc ,iqcCmMethodName: iqcCmMethodName,
      iqcCmMethodType:iqcCmMethodType ,iqcCpcmId: iqcCpcmId,iqcCpcmResponsibility: iqcCpcmResponsibility,iqcCpcmSampleUomId:iqcCpcmSampleUomId ,iqcCpeEvalTechnique: iqcCpeEvalTechnique,iqcCpeId: iqcCpeId,iqcCpeMtAssetTypeId:iqcCpeMtAssetTypeId ,iqcIiId: iqcIiId,
      ipcIspUomId:ipcIspUomId ,iqcCpsImfgpId: iqcCpsImfgpId,iqcCpsIspId: iqcCpsIspId,iqcIiInspectionBy:iqcIiInspectionBy,
    
    iqcIiInspectionStatus: iqcIiInspectionStatus,iqcIiObsStatus:  iqcIiObsStatus,iqcIiSampleSize:iqcIiSampleSize,iqcIiSampleUomId:iqcIiSampleUomId,
    
    iqcIspAssetSpecId:iqcIspAssetSpecId,iqcIspDatatype: iqcIspDatatype,iqcIspId: iqcIspId,iqcIspIsgId: iqcIspIsgId,iqcIspParamName:iqcIspParamName,iqcCpsAssetType:iqcCpsAssetType ,iqcCpsRangeFrom:iqcCpsRangeFrom
    ,iqcCpsRangeTo:iqcCpsRangeTo ,iqcCpsSeq:iqcCpsSeq ,iqcCpsSpecType:iqcCpsSpecType ,iqcCpsValue:iqcCpsValue );

    final int? ipcIspUomId;
    final int? iqcIiId;
    final int? iqcCpeId;
    final String? iqcCmMethodName;
    final String? iqcCmMethodDesc;
    final String? iqcIspParamName;
    final int? iqcCpcmSampleUomId;
    final int? iqcIiSampleUomId;
    final int? iqcIiObsStatus;
    final String? iqcCpeEvalTechnique;
    final int? iqcCpeMtAssetTypeId;
    final int? iqcIiInspectionBy;
    final int? iqcCpsRangeFrom;
    final int? iqcIspIsgId;
    final int? iqcCpsValue;
    final int? iqcIspDatatype;
    final int? iqcCpsSeq;
    final int? iqcIspAssetSpecId;
    final int? iqcCmMethodType;
    final int? iqcIiInspectionStatus;
    final int? iqcCpsImfgpId;
    final int? iqcCpcmResponsibility;
    final int? iqcCpsSpecType;
    final int? iqcCpsIspId;
    final int? iqcCpsRangeTo;
    final int? iqcIiSampleSize;
    final int? iqcCpcmId;
    final int? iqcIspId;
    final int? iqcCpsAssetType;

    factory SpecificationParameter.fromJson(Map<String, dynamic> json){ 
        return SpecificationParameter(
    ipcIspUomId: json["ipc_isp_uom_id"],
            iqcIiId: json["iqc_ii_id"],
            iqcCpeId: json["iqc_cpe_id"],
            iqcCmMethodName: json["iqc_cm_method_name"],
            iqcCmMethodDesc: json["iqc_cm_method_desc"],
            iqcIspParamName: json["iqc_isp_param_name"],
            iqcCpcmSampleUomId: json["iqc_cpcm_sample_uom_id"],
            iqcIiSampleUomId: json["iqc_ii_sample_uom_id"],
            iqcIiObsStatus: json["iqc_ii_obs_status"],
            iqcCpeEvalTechnique: json["iqc_cpe_eval_technique"],
            iqcCpeMtAssetTypeId: json["iqc_cpe_mt_asset_type_id"],
            iqcIiInspectionBy: json["iqc_ii_inspection_by"],
            iqcCpsRangeFrom: json["iqc_cps_range_from"],
            iqcIspIsgId: json["iqc_isp_isg_id"],
            iqcCpsValue: json["iqc_cps_value"],
            iqcIspDatatype: json["iqc_isp_datatype"],
            iqcCpsSeq: json["iqc_cps_seq"],
            iqcIspAssetSpecId: json["iqc_isp_asset_spec_id"],
            iqcCmMethodType: json["iqc_cm_method_type"],
            iqcIiInspectionStatus: json["iqc_ii_inspection_status"],
            iqcCpsImfgpId: json["iqc_cps_imfgp_id"],
            iqcCpcmResponsibility: json["iqc_cpcm_responsibility"],
            iqcCpsSpecType: json["iqc_cps_spec_type"],
            iqcCpsIspId: json["iqc_cps_isp_id"],
            iqcCpsRangeTo: json["iqc_cps_range_to"],
            iqcIiSampleSize: json["iqc_ii_sample_size"],
            iqcCpcmId: json["iqc_cpcm_id"],
            iqcIspId: json["iqc_isp_id"],
            iqcCpsAssetType: json["iqc_cps_asset_type"],
        );
    }

}
