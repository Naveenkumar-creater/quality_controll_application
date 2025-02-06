import 'package:qc_control_app/feature/domain_layer/entity/list_status_entity.dart';

class ListofStatusModel extends ListStatusEntity {
    ListofStatusModel({
        required this.listOfStatusLable,
    }):super(listOfStatusLable:listOfStatusLable );

    final List<ListOfStatusLable> listOfStatusLable;

    factory ListofStatusModel.fromJson(Map<String, dynamic> json){ 
        return ListofStatusModel(
            listOfStatusLable: json["response_data"]["List_Of_Status_Lable"] == null ? [] : List<ListOfStatusLable>.from(json["response_data"]["List_Of_Status_Lable"]!.map((x) => ListOfStatusLable.fromJson(x))),
        );
    }

}

class ListOfStatusLable extends ListOfStatusLabelEntity {
    ListOfStatusLable({
        required this.clId,
        required this.clLabel,
    }):super(clId:clId , clLabel: clLabel);

    final int? clId;
    final String? clLabel;

    factory ListOfStatusLable.fromJson(Map<String, dynamic> json){ 
        return ListOfStatusLable(
            clId: json["cl_id"],
            clLabel: json["cl_label"],
        );
    }

}
