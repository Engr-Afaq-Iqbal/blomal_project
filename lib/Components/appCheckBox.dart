import 'package:blomal_project/Theme/colors.dart';
import 'package:blomal_project/Utils/fontStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/dimensions.dart';

class AppCheckBox extends StatefulWidget {
  String? txt;
  final ValueChanged<bool?> onChanged;
  bool? isChecked;
  AppCheckBox({super.key, this.txt, required this.onChanged, this.isChecked});

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 18.h,
          width: 18.w,
          child: Checkbox(
            checkColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            // fillColor:
            //     MaterialStateProperty.resolveWith(getColor),
            fillColor: MaterialStateProperty.resolveWith(getFillColor),
            side: BorderSide(width: 1.sp, color: Colors.grey),
            value: widget.isChecked,
            activeColor: primaryBlueColor,
            onChanged: widget.onChanged,
          ),
        ),
        size10w,
        customText(text: '${widget.txt}', textStyle: regular14NavyBlue),
      ],
    );
  }

  Color getFillColor(Set<MaterialState> states) {
    // Check if the checkbox is checked
    if (states.contains(MaterialState.selected)) {
      // If checked, return the active color
      return primaryBlueColor;
    } else {
      // If not checked, return grey
      return Colors.grey;
    }
  }
}
