import 'package:equatable/equatable.dart';

class InspectionSampleEntity extends Equatable {
    InspectionSampleEntity({
        required this.listOfSamplesEntity,
    });

    final List<ListOfSampleEntity> listOfSamplesEntity;
    
      @override
      // TODO: implement props
      List<Object?> get props => listOfSamplesEntity;


}

class ListOfSampleEntity extends Equatable {
    ListOfSampleEntity({
        required this.iqcIiqMaxSampleSize,
        required this.iqcIisSampleTag,
        required this.iqcIiqStatus,
        required this.imfgpPaId,
        required this.iqcIiqSampleUomId,
        required this.iqcIiqIieId,
        required this.iqciisId
    });

    final int? iqcIiqMaxSampleSize;
    final String? iqcIisSampleTag;
    final int? iqcIiqStatus;
    final int? imfgpPaId;
    final int? iqcIiqSampleUomId;
    final int? iqcIiqIieId;
      final int? iqciisId;
    
      @override
      // TODO: implement props
      List<Object?> get props => [
 iqcIiqMaxSampleSize,
 iqcIisSampleTag,
   iqcIiqStatus,
   imfgpPaId,
   iqcIiqSampleUomId,
   iqcIiqIieId,
    
      ];



}
