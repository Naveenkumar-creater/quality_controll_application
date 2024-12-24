import 'package:equatable/equatable.dart';
class InspectionParameterEntity extends Equatable {
    InspectionParameterEntity({
        required this.specificationParameterEntity,
    });

    final List<SpecificationParameterEntity> specificationParameterEntity;
    
      @override
      // TODO: implement props
      List<Object?> get props => [specificationParameterEntity];

}

class SpecificationParameterEntity extends Equatable {
    SpecificationParameterEntity({
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
    });

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
    
      @override
      // TODO: implement props
      List<Object?> get props => [ipcIspUomId,iqcIspDatatype,iqcIspAssetSpecId,iqcIiInspectionStatus,iqcIspParamName,
      iqcCpsImfgpId, iqcCpsIspId,
    iqcIiSampleUomId ,
    iqcIiSampleSize,
    iqcIiObsStatus,
    iqcIspId,
    iqcIiInspectionBy,
    iqcIspIsgId,
      ];

    

}
