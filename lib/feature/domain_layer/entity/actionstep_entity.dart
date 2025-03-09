import 'package:equatable/equatable.dart';



class ActionStepEntity extends Equatable {
    ActionStepEntity({
        required this.codeList,
    });

    final List<CodeListEntity> codeList;



    @override
    List<Object?> get props => [
    codeList, ];
}

class CodeListEntity extends Equatable {
    CodeListEntity({
        required this.clId,
        required this.clAlternateId,
        required this.clLabel,
    });

    final int? clId;
    final String? clAlternateId;
    final String? clLabel;

    @override
    List<Object?> get props => [
    clId, clAlternateId, clLabel, ];
}
