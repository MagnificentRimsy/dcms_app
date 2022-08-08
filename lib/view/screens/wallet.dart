// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dcms_app/view/screens/components/cards.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    child: Text(
                      'Hi, Rimamchirika',
                      style: TextStyle(fontSize: 21.0),
                    ),
                    onTap: () {},
                  ),
                  CircleAvatar(
                    radius: 30.0,
                    child: ClipRRect(
                      child: Image.asset('assets/user.jpg'),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
          
                   Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    colors: const [Color(0xFFf7941d), Color(0xFFef8000)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/design.png',
                                ),
                                fit: BoxFit.cover),
                          )),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 30.0, bottom: 5),
                            child: Container(
                              child: Text(
                                'Total Wallet Balance',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Container(
                              child: Text(
                                '4000,000.00',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              child: Text(
                                'Total FFB Supplied',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              child: Text(
                                '1000 (Tones)',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

          
          
          
                // Padding(
                //   padding: const EdgeInsets.only(top: 20, bottom: 10),
                //   child: Text(
                //     'WALLET BALANCE',
                //     style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(10),
                //   child: Text(
                //     '₦200,000.00',
                //     style: TextStyle(
                //         fontSize: 28.0,
                //         color: Colors.green,
                //         fontWeight: FontWeight.bold),
                //   ),
                // ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              
                 Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 25, right:15, top:8.0, bottom: 8.0),
                            child: HomeTabCardSmall(
                              onPressed: () {},
                              title: 'Amount Due',
                              icon: Icons.money,
                             
                              foregroundColor: Color.fromARGB(187, 0, 0, 0),
                              backgroundColor: Color(0xff90EE90),
                            ),
                          ),
                        ),
             
                 Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 20, top:8.0, bottom: 8.0),
                            child: HomeTabCardSmall(
                              onPressed: () {},
                              title: 'Amount Due',
                              icon: Icons.money,
                             
                              foregroundColor: Color.fromARGB(187, 0, 0, 0),
                              backgroundColor: Color(0xffA7F432),
                            ),
                          ),
                        ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Card(
                //     elevation: 0,
                //     child: Container(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(5.0),
                //         gradient: const LinearGradient(
                //           colors: [
                //             Color.fromARGB(51, 161, 161, 161),
                //             Color.fromARGB(70, 143, 171, 2)
                //           ],
                //           begin: Alignment.centerLeft,
                //           end: Alignment.bottomRight,
                //         ),
                //       ),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Padding(
                //             padding: EdgeInsets.only(
                //                 left: 30, right: 30, top: 10, bottom: 20),
                //             child: Container(
                //               child: const Text(
                //                 'AMOUNT DUE',
                //                 style: TextStyle(
                //                     color: Colors.black54,
                //                     fontSize: 14,
                //                     fontWeight: FontWeight.bold),
                //               ),
                //             ),
                //           ),
                //           Padding(
                //             padding: EdgeInsets.only(
                //                 left: 30, right: 30, top: 10, bottom: 20),
                //             child: Text(
                //               '₦ 200,000',
                //               style: TextStyle(
                //                   color: Colors.black,
                //                   fontSize: 20,
                //                   fontWeight: FontWeight.normal),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Card(
                //     elevation: 0,
                //     child: Container(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(5.0),
                //         gradient: const LinearGradient(
                //           colors: [
                //             Color.fromARGB(51, 161, 161, 161),
                //             Color.fromARGB(70, 143, 171, 2)
                //           ],
                //           begin: Alignment.centerLeft,
                //           end: Alignment.bottomRight,
                //         ),
                //       ),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Padding(
                //             padding: EdgeInsets.only(
                //                 left: 30, right: 30, top: 10, bottom: 20),
                //             child: Container(
                //               child: const Text(
                //                 'AMOUNT PAID',
                //                 style: TextStyle(
                //                     color: Colors.black54,
                //                     fontSize: 14,
                //                     fontWeight: FontWeight.bold),
                //               ),
                //             ),
                //           ),
                //           Padding(
                //             padding: EdgeInsets.only(
                //                 left: 30, right: 30, top: 10, bottom: 20),
                //             child: Text(
                //               '₦300,000',
                //               style: TextStyle(
                //                   color: Colors.black,
                //                   fontSize: 20,
                //                   fontWeight: FontWeight.normal),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
             
             
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0, right: 20, left: 20, bottom: 20),
              child: Card(
                elevation: .2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 255, 255, 255),
                        Color.fromARGB(255, 255, 255, 255)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Container(
                                child: const Icon(
                              Icons.calendar_month,
                              size: 20,
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Container(
                              child: const Text(
                                'DUE DATE',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10, top: 20, bottom: 20, right: 25),
                            child: Text(
                              '20th July 2022',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.green,
              tabs: [
                Tab(
                  child: Text(
                    'Transactions',
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ),
                Tab(
                  child: Text(
                    'Payment History',
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Column(children: [
              
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
                                      Icons.abc,
                                      color: Colors.green,
                                    ),
                                  ),
                          title: Text('NGN 100,000',
                                      style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('Mill Gate'),
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
                                
                                
                          onTap: () {},
                        ),
                      ),
                    ),
                   
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 10, right: 10),
                    //   child: Card(
                    //     elevation: 0,
                    //     shape: RoundedRectangleBorder(
                    //       side: BorderSide(
                    //         color: Color(0xffD2CDDE),
                    //       ),
                    //       borderRadius: BorderRadius.circular(15.0),
                    //     ),
                    //     child: ListTile(
                    //       contentPadding:
                    //           EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    //       leading: CircleAvatar(
                    //                 radius: 25.0,
                    //                 backgroundColor: Theme.of(context).backgroundColor,
                    //                 child: Icon(
                    //                   Icons.abc,
                    //                   color: Colors.green,
                    //                 ),
                    //               ),
                    //       title: Text('NGN 200,000',
                    //                   style: TextStyle(fontWeight: FontWeight.bold)),
                    //       subtitle: Text('Mill Gate'),
                    //       trailing: Column(
                    //                 children: <Widget>[
                    //                   //  Text('23 July 2022'),
                    //                   Padding(
                    //                     padding: const EdgeInsets.only(top: 15.0),
                    //                     child: Text(
                    //                       'View Details',
                    //                       style: TextStyle(
                    //                         color: Colors.green,
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                          
                    //       onTap: () {},
                    //     ),
                    //   ),
                    // ),

                    
                  ]),
                  Center(
                    child: Text(
                      'Screen 2',
                    ),
                  )
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
