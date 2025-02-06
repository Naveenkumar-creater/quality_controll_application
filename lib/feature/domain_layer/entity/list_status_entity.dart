import 'package:equatable/equatable.dart';

class ListStatusEntity extends Equatable {
    ListStatusEntity({
        required this.listOfStatusLable,
    });

    final List<ListOfStatusLabelEntity> listOfStatusLable;



    @override
    List<Object?> get props => [
    listOfStatusLable, ];
}

class ListOfStatusLabelEntity extends Equatable {
    ListOfStatusLabelEntity({
        required this.clId,
        required this.clLabel,
    });

    final int? clId;
    final String? clLabel;

    @override
    List<Object?> get props => [
    clId, clLabel, ];
}
