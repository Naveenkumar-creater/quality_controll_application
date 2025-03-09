


import 'package:qc_control_app/feature/domain_layer/entity/actionstep_entity.dart';

class ActionStepModel extends ActionStepEntity {
    ActionStepModel({
        required this.codeList,
    }) : super(codeList: codeList);

    final List<CodeList> codeList;

    factory ActionStepModel.fromJson(Map<String, dynamic> json){ 
        return ActionStepModel(
            codeList: json["response_data"]["code_list"] == null ? [] : List<CodeList>.from(json["response_data"]["code_list"]!.map((x) => CodeList.fromJson(x))),
        );
    }

}

class CodeList  extends CodeListEntity{
    CodeList({
        required this.clId,
        required this.clAlternateId,
        required this.clLabel,
    }):super(clAlternateId: clAlternateId, clId: clId, clLabel:clLabel );

    final int? clId;
    final String? clAlternateId;
    final String? clLabel;

    factory CodeList.fromJson(Map<String, dynamic> json){ 
        return CodeList(
            clId: json["cl_id"],
            clAlternateId: json["cl_alternate_id_1"],
            clLabel: json["cl_label"],
        );
    }


}
