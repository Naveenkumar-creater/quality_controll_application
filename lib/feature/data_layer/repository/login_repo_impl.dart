import 'package:qc_control_app/feature/data_layer/remote/login_datasource.dart';
import 'package:qc_control_app/feature/domain_layer/repository/login_repository.dart';

import '../model/login_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSourceImpl loginDataSourceImpl;

  LoginRepositoryImpl(this.loginDataSourceImpl);

  @override
  Future<LoginModel> loginInUser(String loginId, String password) async {
    final loginModel = await loginDataSourceImpl.loginInUser(loginId, password);
    return loginModel;
  }
}
