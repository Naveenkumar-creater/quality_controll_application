import 'dart:ffi' as ffi;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/eventquee_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/eventqueelocaldata_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/inspecSampleLocalData_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/inspectionparameter_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/inspectionsample_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/layout_name_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/login_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/obs_sample_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/obsparameter_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/process_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/url_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/widget/loginpage_widget/loginpage_layout.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final screenWidth= MediaQuery.of(context as BuildContext).size.width;

      SystemChrome.setPreferredOrientations(
  screenWidth < 576
          ? [
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ]
            
          : [
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.landscapeRight,
            ],
  
  );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(
          create: (_) => LoginProvider(),
        ),
         ChangeNotifierProvider<ProcessProvider>(
          create: (_) => ProcessProvider(),
        ),
        ChangeNotifierProvider<UrlProvider>(create: (_)=>UrlProvider()),
        ChangeNotifierProvider<LayoutNameProvider>(create: (_)=>LayoutNameProvider()),
        ChangeNotifierProvider<EventqueeProvider>(create: (_)=>EventqueeProvider()),
        ChangeNotifierProvider<InspectionparameterProvider>(create: (_)=>InspectionparameterProvider()),
        ChangeNotifierProvider<ObsSampleProvider>(create: (_)=>ObsSampleProvider()),
        ChangeNotifierProvider(create: (_)=>InspectionsampleProvider()),
        ChangeNotifierProvider(create: (_)=>EventqueelocaldataProvider()),
         ChangeNotifierProvider(create: (_)=>ObsparameterProvider()),
  ChangeNotifierProvider(create: (_)=>InspecsampleLocalDataProvider()),
         
        
        
      ],
      child: ScreenUtilInit(
        builder:(_,child)=> MaterialApp(
            title: 'Quality Control',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Color.fromARGB(255, 45, 54, 104)),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: const LoginPageLayout()
            ),
            designSize: MediaQuery.of(context as BuildContext).size.width<576 ? Size(360,760): Size(1296, 800),
      ),
    );
  }
}

