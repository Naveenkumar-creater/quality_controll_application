import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/eventquee_provider.dart';

class Currenttimewidget extends StatefulWidget {
  const Currenttimewidget({super.key});

  @override
  State<Currenttimewidget> createState() => _CurrenttimewidgetState();
}

class _CurrenttimewidgetState extends State<Currenttimewidget> {
 late Stream<String> current;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    current = Stream<String>.periodic(Duration(seconds: 1), (i) {
      final DateTime now = DateTime.now();
      return '${now.day}-${now.month}-${now.year}  ${now.hour}: ${now.minute}:${now.second.toString().padLeft(2, '0')}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<String>(
              stream: current,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    '${snapshot.data}',
                    style: TextStyle(
                   color: Colors.black87,fontFamily: "Lexend",fontSize: 18.sp)
                  );
                } else
                  return Text(
                    'Loading',
                    style: TextStyle(fontSize: 18.sp, color: Colors.black54),
                  );
              },
            );
  }
}