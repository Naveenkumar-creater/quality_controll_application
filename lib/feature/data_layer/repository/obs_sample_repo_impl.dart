import 'package:qc_control_app/feature/data_layer/model/obsSample_model.dart';
import 'package:qc_control_app/feature/data_layer/remote/obs_sample_datasource.dart';

import 'package:qc_control_app/feature/domain_layer/repository/obs_sample_repo.dart';



class ObsSampleRepoImpl implements ObsSampleRepo {
   final ObsSampleDatasource  obsSampleDatasource;
  
  ObsSampleRepoImpl(this.obsSampleDatasource);
  
  @override
  Future<ObsSampleModel> getSample (String token, int inspectionId,int orgid ) {
   final obssample=obsSampleDatasource.getSample(token, inspectionId,  orgid);

   return obssample;
  }



  
}