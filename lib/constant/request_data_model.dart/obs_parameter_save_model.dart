class EventQueeModel {
    EventQueeModel({
        required this.clientAutToken,
        required this.apiFor,
        required this.sampleStatus,
        required this.eventQueId,
        required this.eventTriggerId,
        required this.listOfParamValue,
        required this.orgid,
        required this.sampleid
    });

    final String? clientAutToken;
    final String? apiFor;
    final int? sampleStatus;

    final int? eventTriggerId;
    final int? eventQueId;
    final int ? orgid;
    final int? sampleid;
    final List<ListOfParamValueModel>? listOfParamValue;


    Map<String, dynamic> toJson() => {
        "client_aut_token": clientAutToken,
        "api_for": apiFor,
        "sample_id":sampleid,
        "sample_status": sampleStatus,
       "event_trigger_id":eventTriggerId,
      "event_que_id":eventQueId,
      "org_id":orgid,
      "list_of_param_value": listOfParamValue?.map((listOfParamValue) => listOfParamValue.toJson()).toList(),
    };

}

class ListOfParamValueModel {
    ListOfParamValueModel({
        required this.paramId,
        required this.paramValue,
        required this.paramNotes,
        required this.parameterStatus,
        required this.obsrvationNotes,
        required this.observationId,
        required this.inspectionId,
        required this.cavityvalue
    });

    final int? paramId;
    final double ? paramValue;
    final String? paramNotes;
    final int ? parameterStatus;
    final String ? obsrvationNotes;
    final int? observationId;
        final int? inspectionId;
        final int? cavityvalue;


    Map<String, dynamic> toJson() => {
        "param_id": paramId,
        "param_value": paramValue,
        "param_text": paramNotes,
        "parameter_status": parameterStatus,
        "obsrvation_notes": obsrvationNotes,
        "observation_id": observationId,
        "inspection_id": inspectionId,
        "cavity_no":cavityvalue
    };

}
