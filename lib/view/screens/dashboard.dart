// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:convert';
import 'package:dcms_app/view/screens/components/app_icons.dart';
import 'package:dcms_app/view/screens/components/cards.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  
final List<String> seasonItems = [
  '2022 Season',
  '2021 Season',
];
String? selectedValue;

  bool _isLoading = false;

  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
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

            Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 20.0, right: 20.0, bottom: 25),
                child: Center(
                  child: DropdownButtonFormField2(
                    decoration: InputDecoration(
                      //Add isDense true and zero Padding.
                      //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      //Add more decoration as you want here
                      //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                    ),
                    isExpanded: true,
                    hint: const Text(
                      'Select Season',
                      style: TextStyle(fontSize: 14),
                    ),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 30,
                    buttonHeight: 60,
                    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    items: seasonItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select gender.';
                      }
                    },
                    onChanged: (value) {
                      //Do something when changing the item if you want.
                    },
                    onSaved: (value) {
                      selectedValue = value.toString();
                    },
                  ),
                  // Text(
                  //   '2022 Season',
                  //   style: TextStyle(
                  //       color: Colors.grey[600],
                  //       fontSize: 22.0,
                  //       fontWeight: FontWeight.bold),
                  // ),
                )

                //  eForm(theme),
                ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    


                    colors: const [Color(0xFF8FD400), Color(0xFF299617)],
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 30.0, bottom: 5),
                          child: Container(
                            child: Text(
                              'FFB Pricing as at - 23 June 2022',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0),
             
                  title: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Temera',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 22),
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   'Amount',
                        //   style: TextStyle(
                        //       color: Colors.white,
                        //       fontWeight: FontWeight.normal,
                        //       fontSize: 18),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '- 50k/Tone',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
            
               ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0),
             
                  title: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Dura',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 22),
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   'Amount',
                        //   style: TextStyle(
                        //       color: Colors.white,
                        //       fontWeight: FontWeight.normal,
                        //       fontSize: 18),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '- 30k/Tone',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
            
               ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0),
             
                  title: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Pisitera',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 22),
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   'Amount',
                        //   style: TextStyle(
                        //       color: Colors.white,
                        //       fontWeight: FontWeight.normal,
                        //       fontSize: 18),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '- 20k/Tone',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
            
            
            
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 5.0),
                        //   child: Container(
                        //     child: Text(
                        //       '4000,000.00',
                        //       style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 30,
                        //           fontWeight: FontWeight.bold),
                        //     ),
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                        //   child: Container(
                        //     child: Text(
                        //       'Total FFB Supplied',
                        //       style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 20,
                        //           fontWeight: FontWeight.normal),
                        //     ),
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                        //   child: Container(
                        //     child: Text(
                        //       '1000 (Tones)',
                        //       style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 22,
                        //           fontWeight: FontWeight.bold),
                        //     ),
                        //   ),
                        // ),
                     
                     
                      ],
                    )
                  ],
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
                child: 
                
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    decoration: new BoxDecoration(
                        border: new Border(
                            right: new BorderSide(
                                width: 0.0,
                                color: Color.fromARGB(255, 255, 255, 255)))),
                    child: SvgPicture.asset('assets/trans_icon.svg',
                        semanticsLabel: 'Wallet'),
                  ),
                  title: Text(
                    'Payment Due',
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
                          'Amount',
                          style: TextStyle(
                              color: Color.fromRGBO(64, 75, 96, .9),
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                        Text(
                          'N400,000',
                          style: TextStyle(
                              color: Color.fromRGBO(64, 75, 96, .9),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
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
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    decoration: new BoxDecoration(
                        border: new Border(
                            right: new BorderSide(
                                width: 0.0,
                                color: Color.fromARGB(255, 255, 255, 255)))),
                    child: SvgPicture.asset('assets/history.svg',
                        semanticsLabel: 'Wallet'),
                  ),
                  title: Text(
                    'Last FFB Supplied',
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
                          'Date',
                          style: TextStyle(
                              color: Color.fromRGBO(64, 75, 96, .9),
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                        Text(
                          '23 June 2022',
                          style: TextStyle(
                              color: Color.fromRGBO(64, 75, 96, .9),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ),

            Card(
              elevation: 0,
              child: Container(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title was here
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: HomeTabCard(
                              onPressed: () {},
                              title: 'Manage',
                              icon: Icons.map_rounded,
                              sub: 'Farms',
                              iconColor: Colors.black,
                              backgroundColor: Color(0xFFFED8B1),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: HomeTabCard(
                              onPressed: () {},
                              title: 'FFB',
                              icon: Icons.ac_unit,
                              sub: 'Supplies',
                              iconColor: Colors.black,
                              backgroundColor: Color(0xFFF8D568),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: HomeTabCard(
                              onPressed: () {},
                              title: 'Transactions',
                              icon: Icons.send_and_archive,
                              sub: 'History',
                              iconColor: Colors.black,
                              backgroundColor: Color(0xFFD0F0C0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: HomeTabCard(
                              onPressed: () {},
                              title: 'Manage',
                              icon: Icons.ac_unit,
                              sub: 'Clusters',
                              iconColor: Colors.black,
                              backgroundColor: Color(0xff90EE90),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )

            // Card(
            //     elevation: 2.0,
            //     child: ListView.separated(
            //         scrollDirection: Axis.vertical,
            //         shrinkWrap: true,
            //         separatorBuilder: (BuildContext context, int index) =>
            //             Divider(
            //               height: 2,
            //               color: Color.fromARGB(255, 0, 222, 7),
            //             ),
            //         itemCount: 3,
            //         itemBuilder: (BuildContext context, int index) {
            //           return Container(
            //             decoration: BoxDecoration(
            //                 color: Color.fromARGB(255, 255, 255, 255)),
            //             child: ListTile(
            //               contentPadding: EdgeInsets.symmetric(
            //                   horizontal: 20.0, vertical: 0.0),
            //               leading: Container(
            //                 padding: EdgeInsets.only(right: 12.0),
            //                 decoration: new BoxDecoration(
            //                     border: new Border(
            //                         right: new BorderSide(
            //                             width: 0.0,
            //                             color: Color.fromARGB(255, 255, 255, 255)))),
            //                 child: Icon(Icons.autorenew,
            //                     color: Color.fromRGBO(64, 75, 96, .9)),
            //               ),
            //               title: Text(
            //                 'Recent Transaction',
            //                 style: TextStyle(
            //                     color: Color.fromRGBO(64, 75, 96, .9),
            //                     fontWeight: FontWeight.bold),
            //               ),
            //               // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

            //               subtitle: Row(
            //                 children: <Widget>[
            //                   Expanded(
            //                       flex: 1,
            //                       child: Container(
            //                         // tag: 'hero',
            //                         child: LinearProgressIndicator(
            //                             backgroundColor:
            //                                 Color.fromARGB(51, 255, 255, 255),
            //                             value: 0.2,
            //                             valueColor: AlwaysStoppedAnimation(
            //                                 Colors.green)),
            //                       )),
            //                   Expanded(
            //                     flex: 4,
            //                     child: Padding(
            //                         padding: EdgeInsets.only(left: 10.0),
            //                         child: Text('High',
            //                             style: TextStyle(color: Colors.white))),
            //                   )
            //                 ],
            //               ),
            //               trailing: Icon(Icons.keyboard_arrow_right,
            //                   color: Color.fromRGBO(64, 75, 96, .9),
            //                   size: 30.0),
            //               onTap: () {},
            //             ),
            //           );
            //         }))
          ],
        ),
      ),
    );
  }

  TextField eForm(ThemeData theme) {
    return TextField(
      keyboardType: TextInputType.text,
      autocorrect: true,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.primaryColor, width: 1.0),
        ),
        prefixIcon: Icon(
          Icons.search,
          size: 28.0,
          color: theme.primaryColor,
        ),
        suffixIcon: Icon(
          Icons.filter_list,
          size: 28.0,
          color: theme.primaryColor,
        ),
        hintText: 'Find a Farmer or Cluser',
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: 19.0,
        ),
      ),
    );
  }
}
