import 'package:dcms_app/view/screens/components/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TransactionSuccessWidget extends StatelessWidget {
  const TransactionSuccessWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.lA,
      child: Wrap(
        children: [
          Center(
            child: Icon(Icons.check_box),
          ),
          SizedBox(
            height: 110.h,
          ),
          Center(
            child: Text(
              'Appointment Booked Success',
              style: TextStyle(
                  color: Color(0xff32AA4C),
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Center(
            child: SizedBox(
              width: 230.w,
              child: Text(
                message,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 80.h,
          ),
       
          SizedBox(
            height: 80.h,
          ),
        ],
      ),
    );
  }
}
