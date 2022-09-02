// ignore_for_file: prefer_const_constructors

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import '../view/screens/components/app_icons.dart';
import '../view/screens/components/border_radius.dart';
import '../view/screens/components/paddings.dart';

class AppSnacks {
  AppSnacks._();
  static final List<Flushbar<void>> _snacks = <Flushbar<void>>[];

  static Future<void> show(
    BuildContext context, {
    required String message,
    Color? backgroundColor,
    Duration? duration,
    Widget? leadingIcon,
  }) async {
    final Flushbar<void> flushbar = Flushbar<void>(
      maxWidth: MediaQuery.of(context).size.width,
      messageText: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: AppBorderRadius.smallAll,
          color: backgroundColor ?? Colors.red,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.green.withOpacity(.4),
              blurRadius: 100,
            )
          ],
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: AppPaddings.lA,
              child: leadingIcon ??
                  const Icon(
                    AppIcons.info,
                    size: 20,
                    color: Colors.white,
                  ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Center(
                      child: Text(
                        message,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      forwardAnimationCurve: Curves.ease,
      reverseAnimationCurve: Curves.ease,
      margin: AppPaddings.lH.copyWith(top: 60),
      backgroundColor: Colors.transparent,
      flushbarPosition: FlushbarPosition.TOP,
      animationDuration: const Duration(milliseconds: 500),
      duration: duration ?? const Duration(seconds: 4),
    );
    _snacks.add(flushbar);
    return flushbar.show(context).then((void _) => _snacks.map((Flushbar<void> snack) => snack.dismiss()));
  }
}
