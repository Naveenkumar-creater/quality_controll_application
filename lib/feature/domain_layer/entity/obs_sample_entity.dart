

import 'package:equatable/equatable.dart';

class ObsSampleEntity extends Equatable {
    ObsSampleEntity({
        required this.observationBySampleEntity,
    });

    final List<ObservationBySampleEntity> observationBySampleEntity;
    
      @override
      // TODO: implement props
      List<Object?> get props => throw UnimplementedError();

  

}

class ObservationBySampleEntity extends Equatable {
    ObservationBySampleEntity({
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
    });

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
    
      @override
      // TODO: implement props
      List<Object?> get props => [

          iqcIisSampleTag,
      iqcIiId,
      iqcIioIisId,
      iqcIisId,
      iqcIisIiqId,
      iqcIiCpsId,
      iqcIioIiId,
      iqcIioObservationNumericValue,
      iqcIisSampleSno,
      iqcIiIiqId,
      iqcIioId,
      iqcIioObservationStatus,
      ];

}
