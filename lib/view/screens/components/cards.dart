import 'package:dcms_app/view/screens/components/border_radius.dart';
import 'package:dcms_app/view/screens/components/paddings.dart';
import 'package:flutter/material.dart';

class HomeTabCard extends StatelessWidget {
  const HomeTabCard({
    Key? key,
    required this.iconColor,
    required this.onPressed,
    required this.icon,
    required this.backgroundColor,
    required this.title,
    required this.sub,
  }) : super(key: key);
  final Color iconColor;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final IconData icon;
  final String title;
  final String sub;

  @override
  Widget build(BuildContext context) {

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: AppPaddings.lH.add(AppPaddings.mH),
        shape: RoundedRectangleBorder(
          borderRadius: 
          AppBorderRadius.smallAll,
        ),
        backgroundColor: backgroundColor.withOpacity( 1.0),
      ),
      child: SizedBox(
        height: 184,
        width: double.infinity,
        child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 30),
                  Icon(
                    icon,
                    color: iconColor,
                    size: 25,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    title,
                    textScaleFactor: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 20
                    ),
                  ),
                  const SizedBox(height: 11),
                  Text(
                    sub,
                    textScaleFactor: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}



class HomeTabCardSmall extends StatelessWidget {
  const HomeTabCardSmall({
    Key? key,
    this.foregroundColor,
    required this.onPressed,
    required this.icon,
    required this.backgroundColor,
    required this.title,
  }) : super(key: key);
  final Color? foregroundColor;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: AppPaddings.lH.add(AppPaddings.mH),
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.smallAll,
        ),
        backgroundColor: backgroundColor.withOpacity(.2 ),
      ),
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 30),
                  Icon(
                    icon,
                    color: foregroundColor,
                    size: 17,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    title,
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
