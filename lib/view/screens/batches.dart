// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new

import 'package:dcms_app/view/screens/components/button.dart';
import 'package:dcms_app/view/screens/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/batch_controller.dart';
import '../../data/models/data/batch.dart';

class Batches extends GetView<BatchController> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {

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
              onPressed: () {
                Navigator.pop(context);
                //_tabController.index = 0;
              }),
          centerTitle: true,
          title: Text(
            'Batches',
            style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    child: Text(
                      'Add New Batch',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => Container(
                            height: MediaQuery.of(context).size.height * 0.75,
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(25.0),
                                topRight: const Radius.circular(25.0),
                              ),
                            ),
                            child: Column(
                              children: [
                                GetBuilder<BatchController>(
                                    builder: (batchController) {
                                  return batchController.isLoading.isTrue
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 30),
                                          child: Center(
                                            child: SpinKitDualRing(
                                              color: Colors.green,
                                              lineWidth: 2,
                                            ),
                                          ),
                                        )
                                      : Form(
                                          key: _formKey,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.all(20),
                                                child: const Text(
                                                  'Create Batch',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: const Text(
                                                  'Enter Details',
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 25.0,
                                                  left: 20.0,
                                                  right: 20.0,
                                                ),
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.text,
                                                  autocorrect: true,
                                                  controller: batchController
                                                      .batchDescriptionController,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please batch description';
                                                    }
                                                    return null;
                                                  },
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                        const OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.grey,
                                                              width: 1.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          width: 1.0),
                                                    ),
                                                    prefixIcon: Icon(
                                                      Icons.person_outline,
                                                      size: 28.0,
                                                      color: theme.primaryColor,
                                                    ),
                                                    hintText: 'Description',
                                                    hintStyle: TextStyle(
                                                      color: Colors.grey[400],
                                                      fontSize: 19.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 25.0,
                                               
                                                ),
                                                child: ButtonTheme(
                                                    minWidth: 320.0,
                                                    height: 50.0,
                                                    child: ButtonComponent(
                                                      onPressed: () {
                                                        if (_formKey.currentState!.validate()) {
                                                          addBatch( batchController, context);
                                                        }
                                                      },
                                                      caption: "Submit",
                                                      textColor: Colors.white,
                                                      backgroundColor: Colors.green,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        );
                                }),
                              ],
                            )),
                         );
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
                controller.obx(
                  (data) => Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Color(0xffD2CDDE),
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10.0),
                                  leading: CircleAvatar(
                                    radius: 25.0,
                                    backgroundColor:
                                        Theme.of(context).backgroundColor,
                                    child: Icon(
                                      Icons.close_fullscreen_outlined,
                                      color: Colors.green,
                                    ),
                                  ),
                                  title: Text(
                                      'Batch Id: ${data[index]['batchId']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(data[index]['description']),
                                      Text(data[index]['batchDate']),

                                    ],
                                  ),
                                  trailing: Column(
                                    children: <Widget>[
                                      //  Text('23 July 2022'),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Icon(Icons.more_vert)
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                    //                 Get.toNamed(
                    //   Routes.conversation,
                    //   arguments: controller.chats[index],
                    // );
                                    Get.to(Transactions(), arguments: data[index]);
                                  },
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> addBatch(BatchController controller, context) async {
    String _description = controller.batchDescriptionController.text.trim();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = (prefs.getString('username') ?? '');
    Batch batchBody = Batch(
        description: _description,
        seasonOid: 1,
        userName: username,
        createdBy: username,
        createdOn: DateTime.now());
    return await controller.createBatch(context, batchBody);
  }
}
