import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constant/customwidgets/customtheme.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/eventqueelocaldata_provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/inspecSampleLocalData_provider.dart';

class ObsSampleHeaderWidget extends StatefulWidget {
  @override
  State<ObsSampleHeaderWidget> createState() => _ObsSampleHeaderWidgetState();
}

class _ObsSampleHeaderWidgetState extends State<ObsSampleHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    final eventquee =
        Provider.of<EventqueelocaldataProvider>(context, listen: false)?.queedata;

    final sample=  Provider.of<InspecsampleLocalDataProvider>(context, listen: false)?.sampledata;   
 final TextStyle labelStyle = TextStyle(
      fontFamily: "lexend",
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: Colors.grey.shade600,
    );

    final TextStyle valueStyle = TextStyle(
      fontFamily: "lexend",
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    );

    final size=MediaQuery.of(context).size.width <600;

    return size ? 
        Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Wrap(
                spacing: 10.w,
          
                runSpacing: 10.h,
                children: [
                      _buildInfoTile(
                // icon: Icons.event,
                label: "Event Name",
                value: eventquee?.iqcIeEventName ?? "-",
                labelStyle: labelStyle,
                valueStyle: valueStyle,
              ),
              _buildInfoTile(
                // icon: Icons.card_membership,
                label: "Production Card",
                value: eventquee?.pcCardNo ?? "-",
                labelStyle: labelStyle,
                valueStyle: valueStyle,
              ),
                 
                ],
              ),
            ],
          ),
         const SizedBox(height: 10,),

            Row(
        mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                spacing: 10.w,
          
                runSpacing: 10.h,
                children: [
                
                     _buildInfoTile(
                // icon: Icons.category,
                label: "Item Ref",
                value: "${eventquee?.itemName }" ?? "-",
                labelStyle: labelStyle,
                valueStyle: valueStyle,
              ),
              _buildInfoTile(
                // icon: Icons.build,
                label: "Activity",
                value: "${eventquee?.paActivityName }",
                labelStyle: labelStyle,
                valueStyle: valueStyle,
              ),
                
                ],
              ),
            ],
          ),
    const SizedBox(height: 10,),
          Row(
  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                spacing: 10.w,
          
                runSpacing: 4.h,
                children: [
                
                            _buildInfoTile(
                // icon: Icons.apartment,
                label: "Asset Id",
                value: "${eventquee?.iqcIieAssetId }" ?? "-",
                labelStyle: labelStyle,
                valueStyle: valueStyle,
              ),
              _buildInfoTile(
                // icon: Icons.apartment,
                label: "Samples",
                value: sample?.iqcIisSampleTag ?? "-",
                labelStyle: labelStyle,
                valueStyle: valueStyle,
              ),
             
                ],
              ),
            ],
          ),
        ],
      ),
    ) :
   
   
   
   
 Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 10.w,
      
            runSpacing: 10.h,
            children: [
              _buildInfoTile(
                // icon: Icons.event,
                label: "Event Name",
                value: eventquee?.iqcIeEventName ?? "-",
                labelStyle: labelStyle,
                valueStyle: valueStyle,
              ),
              _buildInfoTile(
                // icon: Icons.card_membership,
                label: "Production Card",
                value: eventquee?.pcCardNo ?? "-",
                labelStyle: labelStyle,
                valueStyle: valueStyle,
              ),
              _buildInfoTile(
                // icon: Icons.category,
                label: "Item Ref",
                value: "${eventquee?.itemName }" ?? "-",
                labelStyle: labelStyle,
                valueStyle: valueStyle,
              ),
              _buildInfoTile(
                // icon: Icons.build,
                label: "Activity",
                value: "${eventquee?.paActivityName }",
                labelStyle: labelStyle,
                valueStyle: valueStyle,
              ),
               _buildInfoTile(
                // icon: Icons.apartment,
                label: "Asset Id",
                value: "${eventquee?.iqcIieAssetId }" ?? "-",
                labelStyle: labelStyle,
                valueStyle: valueStyle,
              ),
              _buildInfoTile(
                // icon: Icons.apartment,
                label: "Samples",
                value: sample?.iqcIisSampleTag ?? "-",
                labelStyle: labelStyle,
                valueStyle: valueStyle,
              ),
                
                            _buildInfoTile(
                // icon: Icons.apartment,
                label: "Issued Date",
                value: "${eventquee?.iqcIiqDate }" ?? "-",
                labelStyle: labelStyle,
                valueStyle: valueStyle,
              ),
             
              // _buildInfoTile(
              //   icon: Icons.list,
              //   label: "Activity",
              //   value: "Moulding",
              //   labelStyle: labelStyle,
              //   valueStyle: valueStyle,
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile({

    // required IconData icon,
    required String label,
    required String value,
    required TextStyle labelStyle,
    required TextStyle valueStyle,
  }) {
    
    final size=MediaQuery.of(context).size.width <600;
    return Container(
      width: size ? 160.w: 174.w,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color:ThemeClass.backgroundcolor,
        borderRadius: BorderRadius.circular(5.r),
        
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Icon(icon, size: 18.sp, color: Colors.grey.shade600),
              // SizedBox(width: 8.w),
              Expanded(
                child: Text(label, style: labelStyle, overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: valueStyle,
            maxLines: 1,
      
          ),
        ],
      ),
    );
  }
}
