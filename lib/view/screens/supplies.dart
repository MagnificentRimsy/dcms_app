// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class Supplies extends StatefulWidget {
  Supplies({Key? key}) : super(key: key);

  @override
  State<Supplies> createState() => _SuppliesState();
}

class _SuppliesState extends State<Supplies>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
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
                title: Text(
                  'Farm Supplies',
                  style: TextStyle(color: Color(0xFF00A850)),
                ),
                leading: BackButton(color: Color(0xFF00A850)),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          height: 20,
                          child: Text(
                            'Most Recent',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color(0xFF4A4B65),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30, left: 10),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Date',
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                            Text(
                                              '21st June 2022',
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30.0, top: 20, bottom: 30),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Transaction Amount',
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                            Text(
                                              '200,000',
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30, left: 30, right: 10),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Due Date',
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                            Text(
                                              '29 July 2022',
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0,
                                          top: 20,
                                          right: 50,
                                          bottom: 30),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Trans ID',
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                            Text(
                                              'OK01123445',
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: OutlinedButton(
                        child: Text(
                          'View Histories',
                          style: TextStyle(fontSize: 14),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 5),
                          primary: Colors.green,
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                        onPressed: () {
                          print('Pressed');
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          height: 15,
                          child: Text(
                            'Recent Transactions',
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
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(
                                        width: 0.0,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)))),
                            child: SvgPicture.asset('assets/images/trans_icon.svg',
                                semanticsLabel: 'Trans'),
                          ),
                          title: Text(
                            'FFB Supply Payment',
                            style: TextStyle(
                                color: Color.fromRGBO(64, 75, 96, .9),
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Amount Due',
                                  style: TextStyle(
                                      color: Color.fromRGBO(64, 75, 96, .9),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10),
                                ),
                                Text(
                                  'N430,021',
                                  style: TextStyle(
                                      color: Color.fromRGBO(64, 75, 96, .9),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                           
                          },
                        ),
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
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                                border: new Border(
                                    right: new BorderSide(
                                        width: 0.0,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)))),
                            child: SvgPicture.asset('assets/images/trans_icon.svg',
                                semanticsLabel: 'Trans'),
                          ),
                          title: Text(
                            'FFB Supply Payment',
                            style: TextStyle(
                                color: Color.fromRGBO(64, 75, 96, .9),
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Amount Due',
                                  style: TextStyle(
                                      color: Color.fromRGBO(64, 75, 96, .9),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10),
                                ),
                                Text(
                                  'N500,021',
                                  style: TextStyle(
                                      color: Color.fromRGBO(64, 75, 96, .9),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                           
                          },
                        ),
                      ),
                    ),
                   
                  ],
                ),
              ),
            ),
          );
        });
  }
}
