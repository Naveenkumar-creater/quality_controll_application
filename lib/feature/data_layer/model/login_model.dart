

import 'package:qc_control_app/feature/domain_layer/entity/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    required this.userLogin,
  }) : super(userLoginEntity: userLogin);

  final UserLogin? userLogin;

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      userLogin: json['response_data']["user_login"] == null
          ? null
          : UserLogin.fromJson(json['response_data']["user_login"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "user_login": userLogin?.toJson(),
      };
}

class UserLogin extends UserLoginEntity {
  UserLogin({
    required this.clientAutToken,
    required this.loginId,
    required this.loginPassword,
    required this.personFname,
    required this.orgId,
    required this.deptName,
    required this.deptId,
    required this.orgName,
  }) : super(
            clientAutToken: clientAutToken,
            deptId: deptId,
            deptName: deptName,
            loginId: loginId,
            loginPassword: loginPassword,
            orgId: orgId,
            orgName: orgName,
            personFname: personFname);

  final String? clientAutToken;
  final String? loginId;
  final String? loginPassword;
  final String? personFname;
  final int? orgId;
  final String? deptName;
  final int? deptId;
  final String? orgName;

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
      clientAutToken: json["client_aut_token"],
      loginId: json["login_id"],
      loginPassword: json["login_password"],
      personFname: json["person_fname"],
      orgId: json["org_id"],
      deptName: json["dept_name"],
      deptId: json["dept_id"],
      orgName: json["org_name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "client_aut_token": clientAutToken,
        "login_id": loginId,
        "login_password": loginPassword,
        "person_fname": personFname,
        "org_id": orgId,
        "dept_name": deptName,
        "dept_id": deptId,
        "org_name": orgName,
      };
}
