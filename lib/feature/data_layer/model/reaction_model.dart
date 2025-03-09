import 'package:qc_control_app/feature/domain_layer/entity/reaction_entity.dart';

class ReactionModel extends ReactionEntity {
    ReactionModel({
        required this.listOfReaction,
    }):super(listOfReaction:listOfReaction );

    final List<ListOfReaction> listOfReaction;

    factory ReactionModel.fromJson(Map<String, dynamic> json){ 
        return ReactionModel(
            listOfReaction: json['response_data']["list_of_reaction"] == null ? [] : List<ListOfReaction>.from(json['response_data']["list_of_reaction"]!.map((x) => ListOfReaction.fromJson(x))),
        );
    }
}

class ListOfReaction extends ListOfReactionEntity {
    ListOfReaction({
        required this.iqcIraCpfrId,
        required this.iqcIirActionEndTime,
        required this.iqcIraResponsibleDept,
        required this.iqcIirLineStatus,
        required this.iqcIraActionNotes,
        required this.iqcIirDate,
        required this.iqcIspParamName,
        required this.iqcIirId,
        required this.iqcIraStartDate,
        required this.iqcIraActionAssignedTo,
        required this.iqcIirIieId,
        required this.iqcIraEndDate,
        required this.iqcIirActionStatus,
        required this.iqcIraIirId,
        required this.iqcIirActionStartTime,
        required this.iqcIraIiqId,
        required this.iqcCrpReactionDesc,
        required this.iqcIraActionStatus,
        required this.iqcCrpSeq,
        required this.iqcIirLineProdOutputStatus,
        required this.iqcIraId,
    }):super(iqcCrpReactionDesc: iqcCrpReactionDesc ,iqcCrpSeq: iqcCrpSeq,iqcIirActionEndTime:iqcIirActionEndTime ,iqcIirActionStartTime: iqcIirActionStartTime,
    iqcIirActionStatus:iqcIirActionStatus ,iqcIirDate: iqcIirDate,iqcIirId: iqcIirId,iqcIirIieId:iqcIirIieId ,iqcIirLineProdOutputStatus:iqcIirLineProdOutputStatus ,
    iqcIirLineStatus: iqcIirLineStatus,iqcIraActionAssignedTo: iqcIraActionAssignedTo,iqcIraActionNotes: iqcIraActionNotes,iqcIraActionStatus: iqcIraActionStatus,iqcIraCpfrId: iqcIraCpfrId,iqcIraEndDate:iqcIraEndDate ,iqcIraId:iqcIraId ,
    iqcIraIiqId:iqcIraIiqId ,iqcIraIirId: iqcIraIirId,iqcIraResponsibleDept: iqcIraResponsibleDept,iqcIraStartDate:iqcIraStartDate ,iqcIspParamName: iqcIspParamName );

    final int? iqcIraCpfrId;
    final DateTime? iqcIirActionEndTime;
    final int? iqcIraResponsibleDept;
    final int? iqcIirLineStatus;
    final String? iqcIraActionNotes;
    final DateTime? iqcIirDate;
    final String? iqcIspParamName;
    final int? iqcIirId;
    final DateTime? iqcIraStartDate;
    final int? iqcIraActionAssignedTo;
    final int? iqcIirIieId;
    final DateTime? iqcIraEndDate;
    final int? iqcIirActionStatus;
    final int? iqcIraIirId;
    final DateTime? iqcIirActionStartTime;
    final int? iqcIraIiqId;
    final String? iqcCrpReactionDesc;
    final int? iqcIraActionStatus;
    final int? iqcCrpSeq;
    final int? iqcIirLineProdOutputStatus;
    final int? iqcIraId;

    factory ListOfReaction.fromJson(Map<String, dynamic> json){ 
        return ListOfReaction(
            iqcIraCpfrId: json["iqc_ira_cpfr_id"],
            iqcIirActionEndTime: DateTime.tryParse(json["iqc_iir_action_end_time"] ?? ""),
            iqcIraResponsibleDept: json["iqc_ira_responsible_dept"],
            iqcIirLineStatus: json["iqc_iir_line_status"],
            iqcIraActionNotes: json["iqc_ira_action_notes"],
            iqcIirDate: DateTime.tryParse(json["iqc_iir_date"] ?? ""),
            iqcIspParamName: json["iqc_isp_param_name"],
            iqcIirId: json["iqc_iir_id"],
            iqcIraStartDate: DateTime.tryParse(json["iqc_ira_start_date"] ?? ""),
            iqcIraActionAssignedTo: json["iqc_ira_action_assigned_to"],
            iqcIirIieId: json["iqc_iir_iie_id"],
            iqcIraEndDate: DateTime.tryParse(json["iqc_ira_end_date"] ?? ""),
            iqcIirActionStatus: json["iqc_iir_action_status"],
            iqcIraIirId: json["iqc_ira_iir_id"],
            iqcIirActionStartTime: DateTime.tryParse(json["iqc_iir_action_start_time"] ?? ""),
            iqcIraIiqId: json["iqc_ira_iiq_id"],
            iqcCrpReactionDesc: json["iqc_crp_reaction_desc"],
            iqcIraActionStatus: json["iqc_ira_action_status"],
            iqcCrpSeq: json["iqc_crp_seq"],
            iqcIirLineProdOutputStatus: json["iqc_iir_line_prod_output_status"],
            iqcIraId: json["iqc_ira_id"],
        );
    }

  
}
