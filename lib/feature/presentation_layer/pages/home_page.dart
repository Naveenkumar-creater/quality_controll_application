import 'package:flutter/material.dart';
import 'package:qc_control_app/constatnt/responsive_layout.dart';
import 'package:qc_control_app/feature/presentation_layer/responsive_screen/desktop_body.dart';
import 'package:qc_control_app/feature/presentation_layer/responsive_screen/mobile_body.dart';
import 'package:qc_control_app/feature/presentation_layer/responsive_screen/tablet_body.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: const MobileScaffold(),
        tablet: const ResponsiveTabletHomepage(),
        desktop: const DesktopScaffold(),
      );
  }
}