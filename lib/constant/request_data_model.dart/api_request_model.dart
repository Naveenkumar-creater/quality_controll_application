class ApiRequestDataModel {
  String? clientAuthToken;
  String apiFor;
  String? loginId;
  String? loginPassword;
  String? clGroup;
  int? deptId;
  int ? statuscount;
  int ? controlplanheaderid;
  int? inspectionid;
  int? processId;
  int ? activityid;
  int ? iqciisid;
  int ? orgid;
  int ? queeid;
   int ?  imfgpid;
   int ? eventid;
     int ? eventtrigerid;
    int ? samplesize;
    int ? questatus;
    int ?  previouseventid ;
    double ? productionqty;
int ? samplesetheaderid;
int ?samplesetstatus;
int ?samplesetindex;
int ? previousId;
    
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
      this.iqciisid,
      this.orgid,
      this. queeid,
     this.imfgpid,
    this. eventid,
    this. eventtrigerid,
    this. samplesize,
    this. questatus,
    this. previouseventid,
    this.productionqty,
    this.samplesetheaderid,
    this.samplesetindex,
    this.samplesetstatus,
    this.previousId
  
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
      "iqc_iis_id":iqciisid,
      "org_id":orgid,
      "queue_id":queeid,
      "imfgp_id":imfgpid,
      "event_id":eventid,
      "event_trigger_id":eventtrigerid,
      "sample_size":samplesize,
      "que_status":questatus,
"iqc_iie_prev_iie_id":  previouseventid,
"production_qty":productionqty,
"iish_id":samplesetheaderid,
"sampleset_status":samplesetstatus,
"sampleset_index":samplesetindex,
"iqc_iie_prev_iie_id":previousId
    };
  }
}








// "{
// "client_aut_token": "goutham-4676",
// "api_for": "list_of_samples",
// "queue_id":1,
// "imfgp_id":1,
// "imfgp_pa_id":13,
// "mpm_id":5,
// "cph_id":1,
// "event_id":1,
// "event_trigger_id":1,
// "sample_size":5,
// "que_status":1,
// "org_id":1
// }
// "