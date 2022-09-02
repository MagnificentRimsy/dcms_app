// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:typed_data';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:dcms_app/view/screens/components/preloader.dart';
import 'package:dcms_app/view/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddProfileDetails extends StatefulWidget {
  const AddProfileDetails({Key? key}) : super(key: key);

  @override
  _AddProfileDetailsState createState() => _AddProfileDetailsState();
}

class _AddProfileDetailsState extends State<AddProfileDetails> {
 
  // Variables

  int _currentStep = 0;
  late bool _isLoading;
  StepperType stepperType = StepperType.vertical;

  dynamic _selectedFarmerTypeOid;
  dynamic inputPadding = 10;
  Color cardBackgroundColor = Colors.grey;

  int selectedItemIndex = -1;
  var accountData = '';
  Color color = Colors.green;
  var _kycService = KycService();

  dynamic seasonName;
  dynamic countryId;
  dynamic countryname;
  dynamic stateId;
  dynamic statename;
  int _activeStepIndex = 0;
  List<DropdownMenuItem> _seasonLists = <DropdownMenuItem>[];
  List<DropdownMenuItem> _titleLists = <DropdownMenuItem>[];
  List<DropdownMenuItem> _maritalStatusLists = <DropdownMenuItem>[];
  List<DropdownMenuItem> _genderLists = <DropdownMenuItem>[];


   dynamic _selectedTitle;
  // List<DropdownMenuItem<String>> get _titleLists {
  //   List<DropdownMenuItem<String>> _titleLists = [
  //     DropdownMenuItem(child: Text("Mr"), value: "Mr"),
  //     DropdownMenuItem(child: Text("Prof."), value: "Prof."),
  //     DropdownMenuItem(child: Text("Miss."), value: "Miss."),
  //     DropdownMenuItem(child: Text("Dr."), value: "Dr."),
  //     DropdownMenuItem(child: Text("Pastor"), value: "Pastor"),
  //     DropdownMenuItem(child: Text("Engr."), value: "Engr"),
  //   ];
  //   return _titleLists;
  // }


  //  List<DropdownMenuItem<String>> get _maritalStatusLists {
  //   List<DropdownMenuItem<String>> _maritalStatus = [
  //     DropdownMenuItem(child: Text("Single"), value: "Single"),
  //     DropdownMenuItem(child: Text("Married"), value: "Married"),
  //     DropdownMenuItem(child: Text("Widow"), value: "Widow"),
  //     DropdownMenuItem(child: Text("Widower"), value: "Widower"),
  //     DropdownMenuItem(child: Text("Divoiced"), value: "Divoiced"),
  //     DropdownMenuItem(child: Text("Seperated"), value: "Seperated"),
  //   ];
  //   return _maritalStatus;
  // }
  dynamic _selectedMaritalStatus;

  List<DropdownMenuItem> _countryLists = <DropdownMenuItem>[];
  List<DropdownMenuItem> _stateLists = <DropdownMenuItem>[]; //to be removed
  List<DropdownMenuItem> _localGovernmentLists = <DropdownMenuItem>[];
  //States LGA for Location
  List<DropdownMenuItem> _stateLocalGovernmentLists = <DropdownMenuItem>[];
  //States LGA for Nationality
  List<DropdownMenuItem> _nationalitystateLocalGovernmentLists =
      <DropdownMenuItem>[];

  List<DropdownMenuItem> _districtLists = <DropdownMenuItem>[];
  List<DropdownMenuItem> _wardLists = <DropdownMenuItem>[];
  List<DropdownMenuItem> _relationshipTypeLists = <DropdownMenuItem>[];

  List<DropdownMenuItem> _meansOfIdentificationLists = <DropdownMenuItem>[];

  List<DropdownMenuItem> _bankLists = <DropdownMenuItem>[];
  List<DropdownMenuItem> _accountTypeLists = <DropdownMenuItem>[];
  List<DropdownMenuItem> _sectorLists = <DropdownMenuItem>[];
  List<DropdownMenuItem> _subSectorLists = <DropdownMenuItem>[];
  List<DropdownMenuItem> _farmerTypeLists = <DropdownMenuItem>[];
  List<DropdownMenuItem> _occupationLists = <DropdownMenuItem>[];
  dynamic selectedIssuingDate = DateTime.now();
  dynamic selectedExpiryDate = DateTime.now();

  //Bio Information
  TextEditingController firstName = TextEditingController();
  TextEditingController middleName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  //   List<DropdownMenuItem<String>> get _genders {
  //   List<DropdownMenuItem<String>> _genderLists = [
  //     DropdownMenuItem(child: Text("Male"), value: "Male"),
  //     DropdownMenuItem(child: Text("Female"), value: "Female"),
  //   ];
  //   return _genderLists;
  // }
  dynamic _selectedGender;
  

  TextEditingController email = TextEditingController();
  dynamic selectedDateOfBirth = DateTime.now();
  TextEditingController applicantId = TextEditingController();
  TextEditingController bvn = TextEditingController();
  TextEditingController primaryPhone = TextEditingController();
  TextEditingController secondaryPhone = TextEditingController();
  dynamic _selectedSeason;
  dynamic _assignedAgentOid;
  dynamic _selectedCluster;
  dynamic _selectedCooperative;
  TextEditingController contactAddress = TextEditingController();

  late String _imageFile;
  late Uint8List bytes;
  final ImagePicker _picker = ImagePicker();
  dynamic _selectedCoopertiveMembershipStatus;
  dynamic _onBoaringType;// run a check on the onboardingtype and submit 

  //Account Information Information
  TextEditingController accountName = TextEditingController();
  TextEditingController accountNo = TextEditingController();
  dynamic _selectedAccountType = 0;
  dynamic _selectedBank;
  TextEditingController description = TextEditingController();

 //Location info
  dynamic _selectedCountry; 
  TextEditingController location_description = TextEditingController();
  dynamic _selectedState; 
  dynamic _selectedlocalGovernment; 
  TextEditingController others = TextEditingController();
  dynamic _selectedStateLocalGovernment;

  //means of Identification
  TextEditingController idNumber = TextEditingController();
  TextEditingController issuingDate = TextEditingController();
  TextEditingController expiryDate = TextEditingController();
  TextEditingController issuingBody = TextEditingController();
  TextEditingController placeOfIssue = TextEditingController();
  dynamic _selectedMeansOfIdentification = 1;

  //Nationality
  dynamic _selectedNationalityCountry = 0;
  dynamic _selectedNationalityState = 0;
  dynamic _selectedNationalitylocalGovernment;
  dynamic _selectedDistrict;
  dynamic _selectedWard;
  TextEditingController nationality_description = TextEditingController();

  //NextOfKin Information
  TextEditingController nokBvn = TextEditingController();
  TextEditingController nokContactAddress = TextEditingController();
  TextEditingController nokEmail = TextEditingController();
  TextEditingController nokFirstName = TextEditingController();
  dynamic nokSelectedGender = 1;
  TextEditingController nokLastName = TextEditingController();
  TextEditingController nokMiddleName = TextEditingController();
  TextEditingController nokPrimaryPhone = TextEditingController();
  dynamic nokSelectedRelationshipType;
  TextEditingController nokSecondaryPhone = TextEditingController();

  late SharedPreferences _prefs;

 
  // Spouse Info
  TextEditingController spouse_bvn = TextEditingController();
  TextEditingController spouse_email = TextEditingController();
  TextEditingController spouse_firstName = TextEditingController();
  dynamic spouse_selectedGender = 1;
  TextEditingController spouse_lastName = TextEditingController();
  TextEditingController spouse_middleName = TextEditingController();
  TextEditingController spouse_primaryPhone = TextEditingController();
  TextEditingController spouse_contactAddress = TextEditingController();
  TextEditingController spouse_secondaryPhone = TextEditingController();
  dynamic _selectedSpouseStateOid;

  // End of Variables

  showSB() {
    Get.snackbar(
      "Unable to Submit Update Record",

      '',
      // ignore: prefer_const_constructors
      messageText: Text(
        "Kindly fill in all required information to proceed.",
        style: TextStyle(fontSize: Get.width * 0.035, color: Colors.black),
      ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      colorText: Colors.red,
      snackStyle: SnackStyle.FLOATING,
      duration: Duration(seconds: 10),
      mainButton: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            'Ok',
            style: TextStyle(fontSize: Get.width * 0.035),
          )),
    );
  }

  _submitFarmerKyc(
      String firstName,
      String middleName,
      String lastName,
      String email,
      String bvn,
    
      String contactAddress,
      String applicantId,
      dynamic selectedDateOfBirth,
      int providerOid,
      int anchorOid,
      int genderOid,
      int maritalStatus,
      String primaryPhone,
      int seasonOid,
      String secondaryPhone,
      int titleOid,
      int farmerTypeOid,
      
      int _selectedCountry,
      int _selectedState,
      int _selectedlocalGovernment,
      String location_description,
      int _selectedNationalityCountry,
      int _selectedNationalityState,
      int _selectedNationalitylocalGovernment,
      int _selectedDistrict,
      int _selectedWard,
      String nationality_description,
      String nokFirstName,
      String nokMiddleName,
      String nokLastName,
      String nokEmail,
      String nokBvn,
      int nokSelectedGender,
      int nokSelectedRelationshipType,
      String nokPrimaryPhone,
      String nokSecondaryPhone,
      String nokContactAddress,
      String spouse_firstName,
      String spouse_middleName,
      String spouse_lastName,
      String spouse_email,
      String spouse_bvn,
      int spouse_selectedGender,
      String spouse_primaryPhone,
      String spouse_secondaryPhone,
      String spouse_contactAddress,
      String idNumber,
      int _selectedMeansOfIdentification,
      dynamic selectedIssuingDate,
      dynamic selectedExpiryDate,
      String issuingBody,
      dynamic _selectedBank,
      String accountNo,
      String accountName,
      int _selectedAccountType,
      dynamic bytes,
      BuildContext context) async {
    try {
      var _result = await _kycService.submitKyc(
        firstName,
        middleName,
        lastName,
        email,
        bvn,
      
        contactAddress,
        applicantId,
        selectedDateOfBirth,
        providerOid,
        anchorOid,
        genderOid,
        maritalStatus,
        primaryPhone,
        seasonOid,
        secondaryPhone,
        titleOid,
        farmerTypeOid,
        _selectedCountry,
        _selectedState,
        _selectedlocalGovernment,
        _selectedNationalityCountry,
        _selectedNationalityState,
        _selectedNationalitylocalGovernment,
        _selectedDistrict,
        _selectedWard,
        nokFirstName,
        nokMiddleName,
        nokLastName,
        nokEmail,
        nokBvn,
        nokSelectedGender,
        nokSelectedRelationshipType,
        nokPrimaryPhone,
        nokSecondaryPhone,
        nokContactAddress,
        spouse_firstName,
        spouse_middleName,
        spouse_lastName,
        spouse_email,
        spouse_bvn,
        spouse_selectedGender,
        spouse_primaryPhone,
        spouse_secondaryPhone,
        spouse_contactAddress,
        idNumber,
        _selectedMeansOfIdentification,
        selectedIssuingDate,
        selectedExpiryDate,
        issuingBody,
        _selectedBank,
        accountNo,
        accountName,
        _selectedAccountType,
        bytes,
      );
      var result = json.decode(_result.body);
      //  if (result['oid'] != null) {
      print('Registered Farmer Information');
      print(result['firstName'] != null);

      Future.delayed(const Duration(seconds: 1), () {
        Get.to(Home());
      });
      Get.snackbar('Success', 'Farmer Added Success',
          margin: EdgeInsets.only(top: 5, left: 10, right: 10),
          colorText: Color(0xFFFFFFFF),
          backgroundColor: Color(0xFF1AD402));
      setState(() {
        _isLoading = false;
      });
     
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      Get.snackbar('Error', 'Request Failed',
          margin: EdgeInsets.only(top: 5, left: 10, right: 10),
          colorText: Color(0xFFFFFFFF),
          backgroundColor: Color(0xD8B62424));

      print(e);
    }
  }

  // Stepper
  List<Step> stepList() => [
        // Step(
        //     state:
        //         _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
        //     isActive: _activeStepIndex >= 0,
        //     title: const Text('Upload Photo'),
        //     content: Container(
        //       child: Column(
        //         children: [
        //           const SizedBox(
        //             height: 8,
        //           ),

        //           Padding(
        //             padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        //             child: Stack(
        //               children: <Widget>[
        //                 Image(
        //                   // image: _imageFile.isEmpty
        //                   //     ?
        //                      image: AssetImage("assets/images/user.png")
        //                       // : Image.memory(bytes).image

        //                 ),
        //                 Positioned(
        //                   bottom: 1,
        //                   right: 1,
        //                   child: Container(
        //                     height: 40,
        //                     width: 40,
        //                     child: InkWell(
        //                       child: Icon(
        //                         Icons.add_a_photo,
        //                         color: Colors.white,
        //                       ),
        //                       onTap: () {
        //                         {
        //                           // showModalBottomSheet(
        //                           //   context: context,
        //                           //   builder: ((builder) => bottomSheet()),
        //                           // );
        //                         }
        //                       },
        //                     ),
        //                     decoration: BoxDecoration(
        //                       color: Colors.orange[500],
        //                       borderRadius:
        //                           BorderRadius.all(Radius.circular(20)),
        //                     ),
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),

        //         ],
        //       ),
        //     )),


        Step(
          
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('Bio Info'),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.65,
            child: ListView(
              children: <Widget>[
                // isLoading here
                 Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 20),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: TextField(
                                  enabled: false,
                                  decoration: InputDecoration(
                                    labelText: '$seasonName',
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: DropdownButtonFormField<dynamic>(
                                          isExpanded: true,
                                          value: _selectedTitle,
                                          items: _titleLists,
                                          elevation: 5,
                                          hint: Text('Select Title'),
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedTitle = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      child: TextField(
                                        controller: firstName,
                                        decoration: InputDecoration(
                                          // border: OutlineInputBorder(),
                                          labelText: 'Firstname',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      child: TextField(
                                        controller: middleName,
                                        decoration: InputDecoration(
                                          // border: OutlineInputBorder(),
                                          labelText: 'Middlename',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: TextField(
                                  controller: lastName,
                                  decoration: InputDecoration(
                                    // border: OutlineInputBorder(),
                                    labelText: 'Lastname',
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: TextField(
                                  controller: email,
                                  decoration: InputDecoration(
                                    // border: OutlineInputBorder(),
                                    labelText: 'example@gmail.com',
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: DateTimePicker(
                                    type: DateTimePickerType.date,
                                    dateMask: 'd MMM, yyyy',
                                    initialValue: DateTime(1990, 1).toString(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100),
                                    // icon: Icon(Icons.event),
                                    decoration: InputDecoration(
                                        labelText: "Date of Birth"),
                                    dateLabelText: 'Date',
                                    timeLabelText: "Hour",
                                    selectableDayPredicate: (date) {
                                      // Disable weekend days to select from the calendar
                                      if (date.weekday == 6 ||
                                          date.weekday == 7) {
                                        return true;
                                      }

                                      return true;
                                    },
                                    onChanged: (val) {
                                      selectedDateOfBirth = val;
                                      print(
                                          "My DOB is printed: ${selectedDateOfBirth}");
                                    },
                                    validator: (val) {
                                      print(val);
                                      return null;
                                    },
                                    onSaved: (val) => print(val),
                                  ),
                                ),
                              ),
                             
                              Row(
                                children: [
                                  // Expanded(
                                  //   child: Container(
                                  //     padding: EdgeInsets.all(5),
                                  //     child: DropdownButtonFormField<dynamic>(
                                  //       isExpanded: true,
                                  //       value: _selectedMaritalStatus,
                                  //       items: _maritalStatusLists,
                                  //       elevation: 5,
                                  //       hint: Text('Select Marital Status'),
                                  //       onChanged: (dynamic value) {
                                  //         setState(() {
                                  //           _selectedMaritalStatus = value;
                                  //         });
                                  //       },
                                  //     ),
                                  //   ),
                                  // ),
                                  // Expanded(
                                  //   child: Container(
                                  //     padding: EdgeInsets.all(5),
                                  //     child: DropdownButtonFormField<dynamic>(
                                  //       isExpanded: true,
                                  //       value: _selectedGender,
                                  //       items: _genders,
                                  //       elevation: 5,
                                  //       hint: Text('Select Gender'),
                                  //       onChanged: (value) {
                                  //         setState(() {
                                  //           _selectedGender = value;
                                  //         });
                                  //       },
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                              
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                      child: TextField(
                                        controller: bvn,
                                        decoration: InputDecoration(
                                          // border: OutlineInputBorder(),
                                          labelText: 'Bvn',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                      child: TextField(
                                        controller: applicantId,
                                        decoration: InputDecoration(
                                          // border: OutlineInputBorder(),
                                          labelText: 'Applicant ID',
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: DropdownButtonFormField<dynamic>(
                                  isExpanded: true,
                                  value: _selectedFarmerTypeOid,
                                  items: _farmerTypeLists,
                                  elevation: 5,
                                  hint: _farmerTypeLists.isEmpty
                                      ? Text(
                                          'No FarmerType Record',
                                          style: TextStyle(color: Colors.grey),
                                        )
                                      : Text('Select Farmer Type'),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedFarmerTypeOid = value;
                                    });
                                  },
                                ),
                              ),
                             
                             
                              
                              Container(
                                padding: EdgeInsets.all(5),
                                child: TextField(
                                  controller: primaryPhone,
                                  decoration: InputDecoration(
                                    // border: OutlineInputBorder(),
                                    labelText: 'Primary Phone No',
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: TextField(
                                  controller: secondaryPhone,
                                  decoration: InputDecoration(
                                    // border: OutlineInputBorder(),
                                    labelText: 'Secondary Phone No',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                   
                SizedBox(height: 50),
              ],
            ),
          ),

          // Container(
          //   child: Column(
          //     children: [
          //       TextField(
          //         controller: name,
          //         decoration: const InputDecoration(
          //           border: OutlineInputBorder(),
          //           labelText: 'Full Name',
          //         ),
          //       ),
          //       const SizedBox(
          //         height: 8,
          //       ),
          //       TextField(
          //         controller: email,
          //         decoration: const InputDecoration(
          //           border: OutlineInputBorder(),
          //           labelText: 'Email',
          //         ),
          //       ),
          //       const SizedBox(
          //         height: 8,
          //       ),
          //       TextField(
          //         controller: pass,
          //         obscureText: true,
          //         decoration: const InputDecoration(
          //           border: OutlineInputBorder(),
          //           labelText: 'Password',
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ),
 
        
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const Text('Account Details'),
          content: Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                   Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: accountName,
                    decoration: InputDecoration(
                      labelText: 'Enter Account Name',
                    ),
                  ),
                ),
               
                 Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: accountNo,
                    decoration: InputDecoration(
                      labelText: 'Account Number',
                    ),
                  ),
                ),
                  Container(
                  padding: EdgeInsets.all(5),
                  child: DropdownButtonFormField<dynamic>(
                    value: _selectedAccountType,
                    items: _accountTypeLists,
                    // elevation: 5,
                    hint: Text('Select Account Type'),
                    onChanged: (value) {
                      setState(() {
                        _selectedAccountType = value;
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: DropdownButtonFormField<dynamic>(
                    isExpanded: true,
                    value: _selectedBank,
                    items: _bankLists,
                    // elevation: 5,
                    hint: Text('Select Bank'),
                    onChanged: (value) {
                      setState(() {
                        _selectedBank = value;
                      });
                    },
                  ),
                ),
              
                // Verify button was here
                Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: description,
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: DropdownButtonFormField<dynamic>(
                    value: _selectedAccountType,
                    items: _accountTypeLists,
                    // elevation: 5,
                    hint: Text('Select Account Type'),
                    onChanged: (value) {
                      setState(() {
                        _selectedAccountType = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
     
        Step(
          state: _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 2,
          title: const Text('Location Info'),
          content: Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                // Container(
                //   padding: EdgeInsets.all(5),
                //   child: DropdownButtonFormField<dynamic>(
                //     value: _selectedCountry,
                //     items: _countryLists,
                //     // elevation: 5,
                //     hint: Text('Nigeria'),
                //     onChanged: (value) {
                //       setState(() {
                //         _selectedCountry = value;
                //       });
                //     },
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: '$countryname',
                    ),
                  ),
                ),

                const SizedBox(
                  height: 8,
                ),
                // Container(
                //   padding: EdgeInsets.all(5),
                //   child: DropdownButtonFormField<dynamic>(
                //     value: _selectedState,
                //     items: _stateLists,
                //     // elevation: 5,
                //     hint: Text('Select State'),
                //     onChanged: (value) {
                //       setState(() {
                //         _selectedState = value;
                //       });
                //     },
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: '$statename',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: DropdownButtonFormField<dynamic>(
                    value: _selectedStateLocalGovernment,
                    items: _stateLocalGovernmentLists,
                    // elevation: 5,
                    hint: Text('Select Local Govt'),
                    onChanged: (value) {
                      setState(() {
                        _selectedStateLocalGovernment = value;
                      });
                    },
                  ),
                ),

                // DropdownSearch<String>(
                //     //mode of dropdown
                //     mode: Mode.MENU,
                //     //to show search box
                //     showSearchBox: true,
                //     showSelectedItems: true,
                //     //list of dropdown items
                //     items: _localGovernmentList,
                //     label: "Local Governments",
                //     onChanged: print,
                //     //show selected item
                //     selectedItem: _selectedlocalGovernment,
                //   ),

              

                Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    enabled: false,
                    controller: location_description,
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ),
     
        Step(
            state:
                _activeStepIndex <= 3 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 3,
            title: const Text('Means Of Identification'),
            content: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: DateTimePicker(
                        type: DateTimePickerType.date,
                        dateMask: 'd MMM, yyyy',
                        initialValue: DateTime(2015, 1).toString(),
                        firstDate: DateTime(2015),
                        lastDate: DateTime(2100),
                        // icon: Icon(Icons.event),
                        decoration: InputDecoration(labelText: "Expiry Date"),
                        dateLabelText: 'Date',
                        timeLabelText: "Hour",
                        selectableDayPredicate: (date) {
                          // Disable weekend days to select from the calendar
                          if (date.weekday == 6 || date.weekday == 7) {
                            return true;
                          }

                          return true;
                        },
                        onChanged: (val) {
                          selectedExpiryDate = val;
                          print(
                              "Expiry Date is printed: ${selectedExpiryDate}");
                        },
                        validator: (val) {
                          print(val);
                          return null;
                        },
                        onSaved: (val) => print(val),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: DropdownButtonFormField<dynamic>(
                      isExpanded: true,
                      value: _selectedMeansOfIdentification,
                      items: _meansOfIdentificationLists,
                      elevation: 5,
                      hint: Text('Select Identity Type'),
                      onChanged: (value) {
                        setState(() {
                          _selectedMeansOfIdentification = value;
                        });
                      },
                    ),
                  ),
                  
                  Container(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      controller: idNumber,
                      decoration: InputDecoration(
                        labelText: 'Id Number',
                      ),
                    ),
                  ),
                  TextField(
                    controller: issuingBody,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      labelText: 'Issuing Body',
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: DateTimePicker(
                        type: DateTimePickerType.date,
                        dateMask: 'd MMM, yyyy',
                        initialValue: DateTime(2015, 1).toString(),
                        firstDate: DateTime(2015),
                        lastDate: DateTime(2100),
                        // icon: Icon(Icons.event),
                        decoration: InputDecoration(labelText: "Issuing Date"),
                        dateLabelText: 'Date',
                        timeLabelText: "Hour",
                        selectableDayPredicate: (date) {
                          // Disable weekend days to select from the calendar
                          if (date.weekday == 6 || date.weekday == 7) {
                            return true;
                          }

                          return true;
                        },
                        onChanged: (val) {
                          selectedIssuingDate = val;
                          print(
                              "Issuing Date is printed: ${selectedIssuingDate}");
                        },
                        validator: (val) {
                          print(val);
                          return null;
                        },
                        onSaved: (val) => print(val),
                      ),
                    ),
                  ),
               
                 TextField(
                    controller: placeOfIssue,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      labelText: 'Place Of Issue',
                    ),
                  ),
                ],
              ),
            )),
        
        Step(
          state: _activeStepIndex <=  4? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 4,
          title: const Text('Nationality'),
          content: Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                 Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: nationality_description,
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: DropdownButtonFormField<dynamic>(
                    value: _selectedNationalityCountry,
                    items: _countryLists,
                    // elevation: 5,
                    hint: Text('Select Country'),
                    onChanged: (value) {
                      setState(() {
                        _selectedNationalityCountry = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: DropdownButtonFormField<dynamic>(
                    value: _selectedNationalityState,
                    items: _stateLists,
                    // elevation: 5,
                    hint: Text('Select State'),
                    onChanged: (value) {
                      setState(() {
                        _selectedNationalityState = value;
                        // _getNationalityStateLocalGovernments(_selectedNationalityState);
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: DropdownButtonFormField<dynamic>(
                    value: _selectedNationalitylocalGovernment,
                    items: _nationalitystateLocalGovernmentLists,
                    // elevation: 5,
                    hint: _nationalitystateLocalGovernmentLists.isEmpty
                        ? Text(
                            'No LGA Data',
                            style: TextStyle(color: Colors.grey),
                          )
                        : Text('Select Local Govt'),
                    onChanged: (value) {
                      setState(() {
                        _selectedNationalitylocalGovernment = value;
                        // _getNationalityLgaDistricts(_selectedNationalitylocalGovernment);
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: DropdownButtonFormField<dynamic>(
                    value: _selectedDistrict,
                    items: _districtLists,
                    // elevation: 5,
                    hint: _districtLists.isEmpty
                        ? Text(
                            'No District Data',
                            style: TextStyle(color: Colors.grey),
                          )
                        : Text('Select District'),
                    onChanged: (value) {
                      setState(() {
                        _selectedDistrict = value;
                        //_getNationalityDistrictWards(_selectedDistrict);
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: DropdownButtonFormField<dynamic>(
                    value: _selectedWard,
                    items: _wardLists,
                    // elevation: 5,
                    hint: _wardLists.isEmpty
                        ? Text(
                            'No Wards Data',
                            style: TextStyle(color: Colors.grey),
                          )
                        : Text('Select Ward'),
                    onChanged: (value) {
                      setState(() {
                        _selectedWard = value;
                      });
                    },
                  ),
                ),
               
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ),
      
        Step(
            state:
                _activeStepIndex <= 5 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 5,
            title: const Text('Next Of Kin'),
            content: Container(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            controller: nokFirstName,
                            decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              labelText: 'Firstname',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: TextFormField(
                            controller: nokMiddleName,
                            decoration: InputDecoration(
                              labelText: 'Middlename',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      controller: nokLastName,
                      decoration: InputDecoration(
                        labelText: 'Lastname',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      controller: nokEmail,
                      decoration: InputDecoration(
                        labelText: 'example@gmail.com',
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                          child: TextFormField(
                            controller: nokBvn,
                            decoration: InputDecoration(
                              labelText: 'Bvn',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                          child: DropdownButtonFormField<dynamic>(
                            isExpanded: true,
                            value: nokSelectedGender,
                            items: _genderLists,
                            elevation: 5,
                            hint: const Text('Select Gender'),
                            onChanged: (value) {
                              setState(() {
                                nokSelectedGender = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: DropdownButtonFormField<dynamic>(
                      isExpanded: true,
                      value: nokSelectedRelationshipType,
                      items: _relationshipTypeLists,
                      elevation: 5,
                      hint: Text('Relationship Type'),
                      onChanged: (value) {
                        setState(() {
                          nokSelectedRelationshipType = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      controller: nokPrimaryPhone,
                      decoration: InputDecoration(
                        labelText: 'Primary Phone No',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      controller: nokSecondaryPhone,
                      decoration: InputDecoration(
                        labelText: 'Secondary Phone No',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: nokContactAddress,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Contact Address',
                    ),
                  ),
                ],
              ),
            )),
        Step(
          state: StepState.complete,
          isActive: _activeStepIndex >= 6,
          title: const Text('Spouse Info'),
          content: Container(
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          controller: spouse_firstName,
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            labelText: 'Firstname',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          controller: spouse_middleName,
                          decoration: InputDecoration(
                            labelText: 'Middlename',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: spouse_lastName,
                    decoration: InputDecoration(
                      labelText: 'Lastname',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: spouse_email,
                    decoration: InputDecoration(
                      labelText: 'example@gmail.com',
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                        child: TextField(
                          controller: spouse_bvn,
                          decoration: InputDecoration(
                            labelText: 'Bvn',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                        child: DropdownButtonFormField<dynamic>(
                          isExpanded: true,
                          value: spouse_selectedGender,
                          items: _genderLists,
                          elevation: 5,
                          hint: Text('Select Gender'),
                          onChanged: (value) {
                            setState(() {
                              spouse_selectedGender = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: spouse_primaryPhone,
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      labelText: 'Primary Phone No',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: spouse_secondaryPhone,
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      labelText: 'Secondary Phone No',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: spouse_contactAddress,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Contact Address',
                  ),
                ),
              ],
            ),
          ),
        ),
       
        // Step(
        //     state: StepState.complete,
        //     isActive: _activeStepIndex >= 6,
        //     title: const Text('Confirm'),
        //     content: Container(
        //         child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: [
        //          Padding(
        //            padding: const EdgeInsets.all(8.0),
        //            child: Image(
        //                     image:AssetImage("assets/user.png")

        //                   ),
        //          ),
        //         Text('Name: ${firstName.text}, ${lastName.text}'),
        //         Text('Name: ${email.text}'),
        //         Text('Date Of Birth: ${selectedDateOfBirth}'),
        //         Text('Email: ${bvn.text}'),
        //         Text('Email: ${primaryPhone.text}'),

        //       ],
        //     )))
      ];
  // End of Stepper

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Update Your Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(),
                currentStep: _currentStep,
                steps: stepList(),
                onStepContinue: () async {
                  if (_activeStepIndex < (stepList().length - 1)) {
                    setState(() {
                      _activeStepIndex += 1;
                    });
                  } else {
                    setState(() {
                      _isLoading = true;
                    });

                    if (firstName.text.isEmpty ||
                        selectedDateOfBirth == null ||
                        lastName.text.isEmpty ||
                        bvn.text.isEmpty ||
                        _selectedGender == null ||
                        primaryPhone.text.isEmpty ||
                        // _selectedTitle == null  ||
                        // _selectedFarmerTypeOid == null  ||
                        // _selectedSectorOid == null  ||
                        // _selectedSubSectorOid == null  ||

                        _selectedStateLocalGovernment == null ||

                        // _selectedNationalityCountry == null ||
                        // _selectedNationalityState == null ||
                        // _selectedNationalitylocalGovernment == null ||

                        // nokFirstName.text.isEmpty ||
                        // nokLastName.text.isEmpty ||
                        // nokSelectedGender == null||
                        // nokSelectedRelationshipType == null||
                        // nokPrimaryPhone.text.isEmpty ||

                        // idNumber.text.isEmpty ||
                        // _selectedMeansOfIdentification == null ||
                        // selectedIssuingDate == null ||
                        // selectedExpiryDate == null ||
                        // issuingBody.text.isEmpty ||

                        // _selectedBank == null ||
                        // accountNo.text.isEmpty ||
                        // accountname.text.isEmpty ||
                        // _selectedAccountType == null ||
                        bytes == null) {
                      showSB();

                      setState(() {
                        _isLoading = false;
                      });
                    } else {
                      _prefs = await SharedPreferences.getInstance();

                      _submitFarmerKyc(
                          firstName.text,
                          middleName.text,
                          lastName.text,
                          email.text,
                          bvn.text,
                        
                          contactAddress.text,
                          applicantId.text,
                          selectedDateOfBirth,
                          1,
                          1,
                          _selectedGender,
                          _selectedMaritalStatus,
                          primaryPhone.text,
                          1,
                          secondaryPhone.text,
                          _selectedTitle,
                          _selectedFarmerTypeOid,
                         
                          countryId,
                          //_selectedState,
                          1,
                          _selectedStateLocalGovernment,
                          location_description.text,
                          _selectedNationalityCountry,
                          _selectedNationalityState,
                          _selectedNationalitylocalGovernment,
                          1,
                          1,
                          nationality_description.text,
                          nokFirstName.text,
                          nokMiddleName.text,
                          nokLastName.text,
                          nokEmail.text,
                          nokBvn.text,
                          nokSelectedGender,
                          nokSelectedRelationshipType,
                          nokPrimaryPhone.text,
                          nokSecondaryPhone.text,
                          nokContactAddress.text,
                          spouse_firstName.text,
                          spouse_middleName.text,
                          spouse_lastName.text,
                          spouse_email.text,
                          spouse_bvn.text,
                          spouse_selectedGender,
                          spouse_primaryPhone.text,
                          spouse_secondaryPhone.text,
                          spouse_contactAddress.text,
                          idNumber.text,
                          _selectedMeansOfIdentification,
                          selectedIssuingDate,
                          selectedExpiryDate,
                          issuingBody.text,
                          _selectedBank,
                          accountNo.text,
                          accountName.text,
                          _selectedAccountType,
                          bytes,
                          context);

                      print('Submited');
                    }
                  }
                },
                onStepCancel: () {
                  if (_activeStepIndex == 0) {
                    return;
                  }

                  setState(() {
                    _activeStepIndex -= 1;
                  });
                },
                onStepTapped: (int index) {
                  setState(() {
                    _activeStepIndex = index;
                  });
                },
                controlsBuilder: ((context, details) {
                  final isLastStep = _activeStepIndex == stepList().length - 1;
                  return Container(
                    child: Row(
                      children: [
                        if (_activeStepIndex > 0)
                          Expanded(
                            child: ElevatedButton(
                              onPressed: details.onStepCancel,
                              child: const Text('Back'),
                            ),
                          ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: details.onStepContinue,
                            child: (isLastStep)
                                ? const Text('Submit Profile Update ')
                                : const Text('Next'),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.check),
      //   onPressed: switchStepsType,
      // ),
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}

KycService() {}
