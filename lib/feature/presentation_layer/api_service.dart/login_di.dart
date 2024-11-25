import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constatnt/Exception/show_pop_error.dart';
import 'package:qc_control_app/feature/data_layer/remote/login_datasource.dart';
import 'package:qc_control_app/feature/data_layer/repository/login_repo_impl.dart';
import 'package:qc_control_app/feature/domain_layer/entity/login_entity.dart';
import 'package:qc_control_app/feature/domain_layer/usecase/login_usecase.dart';
import 'package:qc_control_app/feature/presentation_layer/pages/home_page.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/loginpage_widget/loginpage_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApiService {
 login({
    required BuildContext context,
    required String loginId,  
    required String password,
  }) async {
    try {
    
      LoginUseCase loginUseCase = LoginUseCase(LoginRepositoryImpl(LoginDataSourceImpl()));

      LoginEntity loginUser = await loginUseCase.execute(loginId, password);

      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString("client_token", loginUser.userLoginEntity?.clientAutToken ?? "");

      Provider.of<LoginProvider>(context, listen: false).setUser(loginUser);

      // Navigate to homepage after refresh callback
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
        result: (route) => false,
      );

      return loginUser;
    } catch (e) {
      ShowError.showAlert(context, e.toString());
      rethrow;
    }
  }

  Future<void> logOutUser(BuildContext context) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString("client_token", "");

  //   context.read<ProcessProvider>().reset();
  // context.read<EmployeeProvider>().reset();
  //  context.read<AttendanceCountProvider>().reset();
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => LoginPageLayout()),
    (Route<dynamic> route) => false,
  );
     
    } catch (e) {
      ShowError.showAlert(context, e.toString());
      rethrow;
    }
  }
}
