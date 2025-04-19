import 'package:flutter/material.dart';
import 'package:qc_control_app/constant/responsive_layout.dart';
import 'package:qc_control_app/feature/presentation_layer/mobile_page.dart/loginpage_widget/mobile_login_page.dart';
import 'package:qc_control_app/feature/presentation_layer/responsive_screen/desktop_body.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/loginpage_widget/prominous_login_page.dart';



class LoginPageLayout extends StatelessWidget {
  const LoginPageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: const LoginPageMobile(),
        tablet: const ProminousLoginPage(),
        desktop: const DesktopScaffold(),
      );
  }
}