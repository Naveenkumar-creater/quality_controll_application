

import 'package:equatable/equatable.dart';

class ObsParameterEntity extends Equatable{
    ObsParameterEntity ({
        required this.observationBySamples,
    });

    final List<ObservationByParameterEntity> observationBySamples;    
      @override
      // TODO: implement props
      List<Object?> get props => [observationBySamples];

}

class ObservationByParameterEntity extends Equatable {
    ObservationByParameterEntity({
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
        required this.iqcIsgGroupName,
        required this.iqcIsgId

        
    });

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
    final String? iqcIsgGroupName;
    final int? iqcIsgId;

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

  map(Null Function() param0) {}

}
