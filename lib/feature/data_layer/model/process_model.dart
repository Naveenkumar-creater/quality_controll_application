import 'package:qc_control_app/feature/domain_layer/entity/process_entity.dart';

class ProcessModel extends ProcessEntity {
  const ProcessModel({
    required this.listOfProcess,
  }) : super(listofProcessEntity: listOfProcess);

  final List<ListOfProcess> listOfProcess;

  factory ProcessModel.fromJson(Map<String, dynamic> json) {
    final processListJson =
        json['response_data']['List_Of_QC_Process']; // Updated key name
    // ignore: avoid_print
    // print('Process List: $processListJson'); // Print the processListJson

    if (processListJson == null) {
      throw Exception(
          'Process is null.'); // Throw an exception if asset list is null
    }

    final processData = (processListJson as List)
        .map((item) => ListOfProcess.fromJson(item))
        .toList();

    return ProcessModel(listOfProcess: processData);
  }

}

class ListOfProcess extends ListofProcessEntity {
  const ListOfProcess(
      {
        required this.mpmName,
        required this.mpmId,
        required this.iqcIiqAssignedTo,
        required this.imfgpId,

      // required  this.shiftStatus
      })
      : assert(mpmId != null), // Ensure processId is not null
        super(
          imfgpId: imfgpId,
          iqcIiqAssignedTo: iqcIiqAssignedTo,mpmId: mpmId,
          mpmName:mpmName 
           );

  // final int? shiftStatus;

    final String? mpmName;
    final int? mpmId;
    final int? iqcIiqAssignedTo;
    final int? imfgpId;

  factory ListOfProcess.fromJson(Map<String, dynamic> json) {
    return ListOfProcess(
             mpmName: json["mpm_name"],
            mpmId: json["mpm_id"],
            iqcIiqAssignedTo: json["iqc_iiq_assigned_to"],
            imfgpId: json["imfgp_id"],
    );
  }
}


