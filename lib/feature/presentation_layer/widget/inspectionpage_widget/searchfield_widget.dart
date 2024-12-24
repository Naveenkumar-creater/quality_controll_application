import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:qc_control_app/feature/presentation_layer/provider/searchquery_provider.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchField({
    Key? key,
    required this.controller,
    required this.onChanged,
    this.hintText = "Search...",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800.w,
     height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color:Colors.grey )
      ),
      child: TextField(
        controller: controller,
       onChanged: (value) {
          // Update the query in the provider
          context.read<SearchQueryProvider>().updateQuery(value);
        },
        decoration: InputDecoration(
contentPadding: EdgeInsets.all(8),
          hintText: hintText,
          border: InputBorder.none,
         suffixIcon : Icon(Icons.search, color: Colors.grey),
         prefixIcon : controller.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear, color: Colors.grey),
                  onPressed: () {
                    controller.clear();
                    onChanged(''); // Notify with an empty string
                  },
                )
              : null,
        ),
      ),
    );
  }
}
