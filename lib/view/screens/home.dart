// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dcms_app/view/screens/dashboard.dart';
import 'package:dcms_app/view/screens/settings.dart';
import 'package:dcms_app/view/screens/supplies.dart';
import 'package:dcms_app/view/screens/wallet.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            Dashboard(),
            WalletScreen(),
            Supplies(),
            SettingsScreen(),

            // NearBy(),
            // Cart(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            labelPadding: const EdgeInsets.only(bottom: 10),
            labelStyle: TextStyle(fontSize: 16.0),
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
                icon: Icon(Icons.production_quantity_limits, size: 28),
                text: 'Supplies',
              ),
              Tab(
                icon: Icon(Icons.apps, size: 28),
                text: 'More',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
