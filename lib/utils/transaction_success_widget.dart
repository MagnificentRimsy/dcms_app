
import 'package:dcms_app/utils/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../view/screens/components/button.dart';
import '../view/screens/components/paddings.dart';
import '../view/screens/home.dart';



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
              child: SvgPicture.asset(
            AssetSVGs.success2.path,
            height: 90.h,
          )     
             
          ),
          SizedBox(
            height: 110.h,
          ),
          Center(
            child: Text(
              'Appointment Booked Success',
              style:TextStyle(
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
     
            ButtonComponent(
                borderRadius: 5,
                onPressed: () {
                  Get.to(Home());
                },
                caption: 'Dismiss',
                textColor: Colors.white,
                backgroundColor: Theme.of(context).primaryColor),
          SizedBox(
            height: 80.h,
          ),
        ],
      ),
    );
  }
}
