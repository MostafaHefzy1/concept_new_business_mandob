import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/style.dart';

class UnderlineRow extends StatefulWidget {
  const UnderlineRow({Key? key}) : super(key: key);

  @override
  _UnderlineRowState createState() => _UnderlineRowState();
}

class _UnderlineRowState extends State<UnderlineRow> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Row(
        children: [
          Container(
            height: 3.h,
            width: 20.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5.r),
              ),
              color: MyColors.primaryColor,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            child: Container(
              height: 3.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.r),
                ),
                color: MyColors.foreignColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
