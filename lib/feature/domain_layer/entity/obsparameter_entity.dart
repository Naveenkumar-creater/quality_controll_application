

import 'package:equatable/equatable.dart';

class ObsParameterEntity extends Equatable{
    ObsParameterEntity ({
        required this.observationBySamples,
    });

    final List<ObservationByParameterEntity> observationBySamples;    
      @override
      List<Object?> get props => [observationBySamples];

}

class ObservationByParameterEntity extends Equatable {
    ObservationByParameterEntity({
        required this.iqcIioDate,
  required this.ipcIspUomId,
        required this.iqcIiId,
        required this.iqcIspDatatype,
        required this.iqcIiCpsId,
        required this.iqcIioIiId,
        required this.iqcIisId,
        required this.iqcIisIiqId,
        required this.iqcIspParamName,
        required this.iqcIsgId,
        required this.iqcIioId,
        required this.iqcIioObservationStatus,
        required this.iqcCpsSpecType,
        required this.iqcIsgGroupName,
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
        required this.iqciiocavityno,
        required this.lastcavityno
        
    });

     final int? ipcIspUomId;
    final int? iqcIiId;
    final int? iqcIiCpsId;
    final int? iqcIioIiId;
    final int? iqcIisId;
    final String? iqcIspParamName;
    final int? iqcIioId;
    final String? iqcIioObservationNotes;
    final double? iqcIioObservationNumericValue;
    final DateTime? iqcIioDate;
    final double? iqcCpsRangeFrom;
    final int? iqcIisSampleSno;
    final int? iqcIiIiqId;
    final String? iqcIioObservationTextValue;
    final int? iqcCpsValue;
    final int? iqcIspDatatype;
    final int? iqcIisIiqId;
    final int? iqcIsgId;
    final int? iqcIioObservationStatus;
    final int? iqcCpsSpecType;
    final String? iqcIsgGroupName;
    final String? iqcCpsSpecDesc;
    final double? iqcCpsRangeTo;
    final int? iqcCpsIspId;
    final int? iqcIioIisId;
    final int? iqciiocavityno;
    final int? lastcavityno;

      @override
      // TODO: implement props
      List<Object?> get props => [
           ipcIspUomId,
     iqcIiId,
     iqcIspDatatype,
     iqcIiCpsId,
     iqcIioIiId,
     iqcIisId,
     iqcIisIiqId,
     iqcIspParamName,
     iqcIioId,
     iqcIioObservationStatus,
     iqcCpsSpecType,
     iqcCpsSpecDesc,
     iqcIioObservationNotes,
     iqcCpsRangeTo,
     iqcCpsIspId,
     iqcIioIisId,
     iqcIioObservationNumericValue,
     iqcCpsRangeFrom,
     iqcIisSampleSno,
     iqcIiIiqId,
     iqcIioObservationTextValue,
     iqcCpsValue,
      ];



}
