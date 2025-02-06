import 'package:equatable/equatable.dart';

class ProcessEntity extends Equatable {
  final List<ListofProcessEntity>? listofProcessEntity;

  const ProcessEntity({
    this.listofProcessEntity,
  });

  @override
  List<Object?> get props => [listofProcessEntity];
}

class ListofProcessEntity extends Equatable {
  const ListofProcessEntity(
      {
               required this.mpmName,
        required this.mpmId,
        required this.iqcIiqAssignedTo,
        required this.imfgpId,
   
      
      });

   final String? mpmName;
    final int? mpmId;
    final int? iqcIiqAssignedTo;
    final int? imfgpId;
  @override
  List<Object?> get props => [
    mpmName, mpmId, iqcIiqAssignedTo, imfgpId];
}
