// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, unnecessary_new

import 'package:dcms_app/controller/batch_controller.dart';
import 'package:dcms_app/core/api_service_provider.dart';
import 'package:dcms_app/models/agent_farmer.dart';
import 'package:dcms_app/respository/transaction_repository.dart';
import 'package:dcms_app/view/screens/components/preloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/transaction_controller.dart';
import '../../models/new_farm_data.dart';
import '../../models/transaction.dart';
import '../../utils/svg_assets.dart';
import 'components/button.dart';

class Transactions extends StatefulWidget {
  Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions>
    with SingleTickerProviderStateMixin {
  var data = Get.arguments;

  NumberFormat moneyFormat = NumberFormat.decimalPattern('en_us');
  String? username;
  @override
  void initState() {
    super.initState();

    print('Collected Data ${data}');
    _getUserName();
  }

  _getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    username = prefs.getInt('useroid').toString();
    print('username-shard ${username}');
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        splitScreenMode: true,
        builder: (context, child) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 140,
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: Column(
                  children: [
                    Text(
                      'Batch Details',
                      style: TextStyle(color: Color(0xFF00A850)),
                    ),
                    Text(
                      'ID: ${data['batchId']}',
                      style: TextStyle(color: Color(0xFF00A850)),
                    ),
                  ],
                ),
                leading: BackButton(color: Color(0xFF00A850)),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description:',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color(0xFF4A4B65),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '${data['description']}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color(0xFF4A4B65),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.grey.shade200,
                          ),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Transaction Amount:',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    '₦' +
                                        moneyFormat.format(
                                            data['summary']['totalAmount']),
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'FFB Collected:',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    '₦' +
                                        moneyFormat.format(data['summary']
                                            ['totalFFBCollected']),
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Amount Due:',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    '₦' +
                                        moneyFormat.format(data['financials']
                                            ['totalAmountDue']),
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Amount Due to Agent:',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Text(
                                    '₦' +
                                        moneyFormat.format(data['financials']
                                            ['totalAmountDueToAgent']),
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              height: 15,
                              child: Text(
                                'Batch Transactions',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Color(0xFF4A4B65),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: ElevatedButton(
                              child: Text("Create Transaction ".toUpperCase(),
                                  style: TextStyle(fontSize: 14)),
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                          side: BorderSide(
                                              color: Colors.green)))),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) => Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.85,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: new BorderRadius.only(
                                          topLeft: const Radius.circular(25.0),
                                          topRight: const Radius.circular(25.0),
                                        ),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            GetBuilder<TransactionController>(
                                                initState: maininit(),
                                                dispose: (c) {
                                                  c.dispose();
                                                },
                                                builder: (controller) {
                                                  return controller
                                                          .isDataProcessing
                                                          .isTrue
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 30),
                                                          child: Center(
                                                            child:
                                                                SpinKitDualRing(
                                                              color:
                                                                  Colors.green,
                                                              lineWidth: 2,
                                                            ),
                                                          ),
                                                        )
                                                      : Form(
                                                          key: controller
                                                              .transactionFormKey,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .stretch,
                                                            children: <Widget>[
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(20),
                                                                child:
                                                                    const Text(
                                                                  'Create Transaction',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          22.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            20),
                                                                child:
                                                                    const Text(
                                                                  'Enter Details',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16.0),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),

                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .only(
                                                                    top: 25.0,
                                                                    left: 10.0,
                                                                    right:
                                                                        10.0),
                                                                child:
                                                                    TextFormField(
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  controller:
                                                                      controller
                                                                          .amountDueController,
                                                                  autocorrect:
                                                                      true,
                                                                  validator:
                                                                      (value) {
                                                                    if (value ==
                                                                            null ||
                                                                        value
                                                                            .isEmpty) {
                                                                      return 'Amount Due';
                                                                    }
                                                                    return null;
                                                                  },
                                                                  decoration:
                                                                      InputDecoration(
                                                                    enabledBorder:
                                                                        const OutlineInputBorder(
                                                                      borderSide: const BorderSide(
                                                                          color: Colors
                                                                              .grey,
                                                                          width:
                                                                              1.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color: Colors
                                                                              .grey,
                                                                          width:
                                                                              1.0),
                                                                    ),
                                                                    prefixIcon: Icon(
                                                                        Icons
                                                                            .money,
                                                                        size:
                                                                            28.0,
                                                                        color: Colors
                                                                            .green),
                                                                    hintText:
                                                                        'Amount Due',
                                                                    hintStyle: TextStyle(
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),

                                                              Padding(
                                                                padding: const EdgeInsets
                                                                        .only(
                                                                    top: 10.0,
                                                                    left: 10.0,
                                                                    right:
                                                                        10.0),
                                                                child:
                                                                    TextFormField(
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  controller:
                                                                      controller
                                                                          .tonnageController,
                                                                  autocorrect:
                                                                      true,
                                                                  validator:
                                                                      (value) {
                                                                    if (value ==
                                                                            null ||
                                                                        value
                                                                            .isEmpty) {
                                                                      return 'Tonnage';
                                                                    }
                                                                    return null;
                                                                  },
                                                                  decoration:
                                                                      InputDecoration(
                                                                    enabledBorder:
                                                                        const OutlineInputBorder(
                                                                      borderSide: const BorderSide(
                                                                          color: Colors
                                                                              .grey,
                                                                          width:
                                                                              1.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide: BorderSide(
                                                                          color: Colors
                                                                              .grey,
                                                                          width:
                                                                              1.0),
                                                                    ),
                                                                    prefixIcon: Icon(
                                                                        Icons
                                                                            .device_thermostat_outlined,
                                                                        size:
                                                                            28.0,
                                                                        color: Colors
                                                                            .green),
                                                                    hintText:
                                                                        'Tonage',
                                                                    hintStyle: TextStyle(
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),

                                                              const SizedBox(
                                                                height: 10,
                                                              ),

                                                              Obx(
                                                                () => Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(left: 10.0,
                                                                        right:
                                                                            10.0),
                                                                    child: controller
                                                                            .listFarmerModel_
                                                                            .value
                                                                            .isNotEmpty
                                                                        ? DropdownButtonFormField<
                                                                            Values>(
                                                                            icon:
                                                                                Container(),
                                                                            value:
                                                                                controller.selectedFarmerId?.value,
                                                                            items: controller.listFarmerModel_.value
                                                                                .map((e) => DropdownMenuItem(
                                                                                      child: Text(
                                                                                        e.name!,
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                        maxLines: 1,
                                                                                        softWrap: false,
                                                                                        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                                                                                      ),
                                                                                      value: e,
                                                                                    ))
                                                                                .toList(),
                                                                            onChanged:
                                                                                (Values? val) {
                                                                              controller.selectedFarmerId = val.obs as Rx<Values>?;

                                                                              if (controller.selectedFarmerId != "0") {
                                                                                print('controller value: ${controller.selectedFarmerId.toString()}');
                                                                                controller.getFarmersFarm(controller.selectedFarmerId.toString());
                                                                              }
                                                                            },
                                                                            isExpanded:
                                                                                true,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              suffixIcon: Padding(
                                                                                padding: const EdgeInsets.only(top: 8.0),
                                                                                child: const Icon(Icons.keyboard_arrow_down),
                                                                              ),
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.all(
                                                                                  Radius.circular(5),
                                                                                ),
                                                                              ),
                                                                              isDense: true,
                                                                              hintText: "Select Farmer",
                                                                            ),
                                                                          )
                                                                        : null),
                                                              ),

                                                              SizedBox(
                                                                height: 10,
                                                              ),

                                                              // how can I please popluate this with the farms array below

                                                              Obx(
                                                                () => Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10.0,
                                                                        right:
                                                                            10.0),
                                                                    child: controller
                                                                            .listFarmModel_
                                                                            .value
                                                                            .isNotEmpty
                                                                        ? DropdownButtonFormField<
                                                                            FarmValues>(
                                                                            icon: Container(),
                                                                            //e.name!
                                                                            value:
                                                                                controller.selectedFarmId?.value,
                                                                            items: controller.listFarmModel_.value
                                                                                .map((e) => DropdownMenuItem(
                                                                                      child: Text(
                                                                                        e.title.toString(),
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                        maxLines: 1,
                                                                                        softWrap: false,
                                                                                        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                                                                                      ),
                                                                                      value: e,
                                                                                    ))
                                                                                .toList(),
                                                                            onChanged:
                                                                                (FarmValues? val) {
                                                                              controller.selectedFarmId = val.obs as Rx<FarmValues>?;
                                                                            },
                                                                            isExpanded:
                                                                                true,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              suffixIcon: Padding(
                                                                                padding: const EdgeInsets.only(top: 8.0),
                                                                                child: const Icon(Icons.keyboard_arrow_down),
                                                                              ),
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.all(
                                                                                  Radius.circular(5),
                                                                                ),
                                                                              ),
                                                                              isDense: true,
                                                                              hintText: "Select Farm",
                                                                            ),
                                                                          )
                                                                        : null),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),

                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10),
                                                                child:
                                                                    const Text(
                                                                  'Select Purchase Date:',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              Container(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10),
                                                                child:
                                                                    DatePickerWidget(
                                                                  looping:
                                                                      false, // default is not looping
                                                                  firstDate:
                                                                      DateTime(
                                                                          2022,
                                                                          1,
                                                                          1),
                                                                  lastDate:
                                                                      DateTime(
                                                                          2030,
                                                                          1,
                                                                          1),
                                                                  initialDate:
                                                                      DateTime
                                                                          .now(),
                                                                  dateFormat:
                                                                      "dd-MMM-yyyy",
                                                                  locale: DatePicker
                                                                      .localeFromString(
                                                                          'en'),
                                                                  onChange: (DateTime
                                                                              newDate,
                                                                          _) =>
                                                                      controller
                                                                              .selectedDate =
                                                                          newDate,
                                                                  pickerTheme:
                                                                      DateTimePickerTheme(
                                                                    itemTextStyle: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            19),
                                                                    dividerColor:
                                                                        Colors
                                                                            .green,
                                                                  ),
                                                                ),
                                                              ),

                                                              ButtonTheme(
                                                                  minWidth:
                                                                      320.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      ButtonComponent(
                                                                    onPressed:
                                                                        () {
                                                                      if (controller
                                                                          .transactionFormKey
                                                                          .currentState!
                                                                          .validate()) {
                                                                        addTransaction(
                                                                            controller,
                                                                            context);
                                                                      }
                                                                    },
                                                                    caption:
                                                                        "Submit",
                                                                    textColor:
                                                                        Colors
                                                                            .white,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .green,
                                                                  )),
                                                            ],
                                                          ),
                                                        );
                                                })
                                          ],
                                        ),
                                      )),
                                );
                              }),
                        )
                      ],
                    ),
                    data['transactions'].length > 0
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: data['transactions']!.length,
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
                                    title: Text(
                                      'TranID: ${data["transactions"][index]["transId"]}',
                                      style: TextStyle(
                                          color: Color.fromRGBO(64, 75, 96, .9),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    subtitle: Text(
                                      'Date: ${data["transactions"][index]["purchaseDate"]} ',
                                      style: TextStyle(
                                          color: Color.fromRGBO(64, 75, 96, .9),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                    trailing: Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Amount Due',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    64, 75, 96, .9),
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            '₦ ' +
                                                moneyFormat.format(
                                                    data["transactions"][index]
                                                        ["amountDue"]),
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    64, 75, 96, .9),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              );
                            })
                        : Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text('No Transactions Created'),
                          )
                  ],
                ),
              ),
            ),
          );
        });
  }

  maininit() {
    print("here");
    Get.put<TransactionController>(
        TransactionController(Repository(ApiServiceProvider())));
    print("here");
    Get.put<BatchController>(BatchController());
    print("here");
  }

  Future<dynamic> addTransaction(
      TransactionController controller, context) async {
    int _amountDue = controller.amountDueController.text.trim() as int;
    var _purchasedDate = controller.purchaseDateController.text.trim();
    var _tonnage = controller.tonnageController.text.trim() as int;
    int _batchOid = 0;
    int _farmerOid = 0;
    int _farmOid = 0;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = (prefs.getString('username') ?? '');
    Transaction transactionBody = Transaction(
        amountDue: _amountDue,
        batchOid: _batchOid,
        farmerOid: _farmerOid,
        farmOid: _farmOid,
        purchaseDate: _purchasedDate,
        tonnage: _tonnage,
        createdBy: username,
        createdOn: DateTime.now().toString());
    return await controller.createTransaction(context, transactionBody);
  }
}
