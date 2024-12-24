import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/constatnt/customwidgets/customtheme.dart';
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

    return Container(
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
                label: "Job ID",
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
                // icon: Icons.qr_code,
                label: "Control Method",
                value: "Every Batch"?? "-",
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
    return Container(
      width: 174.w,
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
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
