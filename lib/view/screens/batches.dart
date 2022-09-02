// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dcms_app/view/screens/batch_transactions.dart';
import 'package:dcms_app/view/screens/components/cards.dart';
import 'package:dcms_app/view/screens/transactions.dart';
import 'package:dcms_app/view/screens/wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

import '../../controller/batch_controller.dart';
import '../../controller/batch_controller.dart';
import 'components/preloader.dart';

class Batches extends StatefulWidget {
  Batches({Key? key}) : super(key: key);

  @override
  State<Batches> createState() => _BatchesState();
}

class _BatchesState extends State<Batches> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 70,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text(
            'Batches',
            style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  child: Text(
                    'Add New Batch',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.only(
                        left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                    primary: Colors.white,
                    backgroundColor: Colors.green,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            scrollable: true,
                            title: Text('Create a Batch'),
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GetBuilder<BatchController>(
                                  builder: (batchController) {
                                return batchController.isLoading == true
                                    ? Preloader()
                                    : Form(
                                        child: Column(
                                          children: <Widget>[
                                            TextFormField(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                labelText: 'Enter Description',
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                              }),
                            ),
                            actions: [
                              RaisedButton(
                                  color: Colors.green,
                                  child: Text("Create",
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  onPressed: () {
                                    // your code
                                  })
                            ],
                          );
                        });
                  },
                ),
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Text(
                  'Recent Batches',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color(0xffD2CDDE),
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Theme.of(context).backgroundColor,
                      child: Icon(
                        Icons.close_fullscreen_outlined,
                        color: Colors.green,
                      ),
                    ),
                    title: Text('BatchID: 20220824121405',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Date: 23 August, 2022'),
                    trailing: Column(
                      children: <Widget>[
                        //  Text('23 July 2022'),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            'View Details',
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Get.to(Transactions());
                    },
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
