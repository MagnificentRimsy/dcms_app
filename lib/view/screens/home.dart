// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dcms_app/view/screens/batches.dart';
import 'package:dcms_app/view/screens/dashboard.dart';
import 'package:dcms_app/view/screens/settings.dart';
import 'package:dcms_app/view/screens/transactions.dart';
import 'package:dcms_app/view/screens/wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/exit_pop.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var data = Get.arguments;

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: TabBarView(
            children: <Widget>[
              Dashboard(),
              WalletScreen(),
              
              SettingsScreen(),

              // NearBy(),
              // Cart(),
            ],
          ),
          bottomNavigationBar: Material(
            color: Colors.white,
            child: TabBar(
              labelPadding: const EdgeInsets.only(bottom: 10),
              labelStyle: TextStyle(fontSize: 14.0.sp),
              indicatorColor: Colors.transparent,
              labelColor: theme.primaryColor,
              unselectedLabelColor: Colors.black54,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.home, size: 28),
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(Icons.account_balance_wallet, size: 28),
                  text: 'Wallet',
                ),
              
                Tab(
                  icon: Icon(Icons.apps, size: 28),
                  text: 'More',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
