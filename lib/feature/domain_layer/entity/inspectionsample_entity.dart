
class InspectionSampleEntity  {
    InspectionSampleEntity({
        required this.listOfSamplesEntity,
    });

    final List<ListOfSampleEntity> listOfSamplesEntity;
    


}

class ListOfSampleEntity {
    ListOfSampleEntity({
        required this.iqcIiqMaxSampleSize,
        required this.iqcIisSampleTag,
        required this.iqcIiqStatus,
        required this.imfgpPaId,
        required this.iqcIiqSampleUomId,
        required this.iqcIiqIieId,
        required this.iqciisId,
        required this.noofpass,
        required this.nooffail,
        required this.insStatus,
        required this.samplesno
    });

    final int? iqcIiqMaxSampleSize;
    final String? iqcIisSampleTag;
    final int? iqcIiqStatus;
    final int? imfgpPaId;
    final int? iqcIiqSampleUomId;
    final int? iqcIiqIieId;
    final int? iqciisId;
    final int? noofpass;
    final int?  samplesno;
    final int?nooffail;
    final String ? insStatus;
    
  



}
