class ApiRequestDataModel {
  String? clientAuthToken;
  String apiFor;
  String? loginId;
  String? loginPassword;
  String? clGroup;
  int? deptId;
  int ? statuscount;
  int ?controlplanheaderid;
  int?inspectionid;
  int?processId;
  int ? activityid;
  int ? iqciisid;
    
  ApiRequestDataModel(
      {this.clientAuthToken,
      required this.apiFor,
      this.deptId,
      this.loginId,
      this.loginPassword,
      this.clGroup,
      this.statuscount,
      this.controlplanheaderid,
      this.inspectionid,
      this.processId,
      this.activityid,
      this.iqciisid
  
      });

  Map<String, dynamic> toJson() {
    return {
      'client_aut_token': clientAuthToken,
      'api_for': apiFor,
      'login_id': loginId,
      'login_password': loginPassword,
      'cl_group': clGroup,
      "status": statuscount,
      "dept_Id": deptId,
      "cph_id":controlplanheaderid,
      "iqc_ii_id":inspectionid,
      "mpm_id": processId,
      "imfgp_pa_id":activityid,
      "iqc_iis_id":iqciisid

    };
  }
}








