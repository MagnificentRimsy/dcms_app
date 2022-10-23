// ignore_for_file: avoid_print, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:cool_stepper/cool_stepper.dart';
import 'package:dcms_app/models/cluster.dart';
import 'package:dcms_app/models/title.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/farmer_controller.dart';
import '../../core/api_service_provider.dart';
import '../../models/cooperative.dart';
import '../../models/marital_status.dart';
import '../../models/relationship_type.dart';
import '../../respository/farmer_repository.dart';
import 'components/exit_pop.dart';

class FarmerProfile extends StatefulWidget {
  FarmerProfile({Key? key}) : super(key: key);

  @override
  _FarmerProfileState createState() => _FarmerProfileState();
}

class _FarmerProfileState extends State<FarmerProfile> {
  final controller = Get.put(FarmerController(FarmerRepository(ApiServiceProvider())));

  String? selectedGender = 'Male';

  String? spouseGender = 'Male';
  String? nokGender = 'Male';



  List<String> genders = [
    'Male',
    'Female',
  ];


  int bioGenderCurrentSelected = 0;

  int nokGenderCurrentSelected = 0;
  
  int spouseGenderCurrentSelected = 0;

  
  //bio data
  var bioSelectedTitle;
  var bioSelectedGender;
  var bioSelectedDateOfBirth;
  var selectedCluster;
  var selectedMaritalStatus;
  var selectedCooperative;

  // accounts dropdowns
  var selectedAccountType;
  var selectedBankId;

  //location
  var selectedCountryId;
  var selectedStateOfOriginId;
  var selectedLocalGovernmentId;

  //meansofID
  var selectedIdentityType;
  var selectedIssuingDate;
  var selectedExpiryDate;

  //nationality
  var selectedNationalityCountryId;
  var selectedNationalityStateId;
  var selectedNationalityLocalGovernmentId;

  //nextOfKin
  var selectedNokRelationshipType;
  var selectedNokStateId;
  var selectedNokGender;

  //spouse
  var selectedSpouseStateId;
  var selectedSpouseGender;   

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final steps = [
      CoolStep(
        title: 'Bio Information',
        subtitle: 'Please fill some of the basic farmer information',
        content: Form(
          key: controller.firstStepFormKey,
          child: GetBuilder<FarmerController>(
              initState: maininit(),
              builder: (controller) {
                return Column(
                  children: [
                    Obx(
                      () => Padding(
                          padding: const EdgeInsets.only(left: 0, right: 0),
                          child: controller.listTitleModel_.value.isNotEmpty
                              ? DropdownButtonFormField<Values?>(
                                  icon: Container(),
                                  value: controller.selectedTitleId?.value,
                                  items: controller.listTitleModel_.value
                                      .map((e) => DropdownMenuItem(
                                            child: Text(
                                              e.name!,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              softWrap: false,
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            value: e,
                                          ))
                                      .toList(),
                                  onChanged: (Values? val) {
                                    controller.setTitleId(val);
                                    setState(() {
                                      bioSelectedTitle = val!.oid;
                                    });
                                  },
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(top: 0.0),
                                      child:
                                          const Icon(Icons.keyboard_arrow_down),
                                    ),
                                    isDense: true,
                                    hintText: "Select Title",
                                  ),
                                )
                              : null),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            labelText: 'First Name',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'FirstName is required';
                              }
                              return null;
                            },
                            controller: controller.firstNameController,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: _buildTextField(
                            labelText: 'Middle Name',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return null;
                              }
                            },
                            controller: controller.middleNameController,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            labelText: 'Last Name',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'LastName is required';
                              }
                              return null;
                            },
                            controller: controller.lastNameController,
                          ),
                        ),
                        // gender dropdown here
                        SizedBox(
                          width: 10,
                        ),

                        Expanded(
                          child: _buildTextField(
                            labelText: 'example@mail.com',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email cannot be empty";
                              }
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("Please enter a valid email");
                              } else {
                                return null;
                              }
                            },
                            controller: controller.emailController,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            labelText: 'BVN',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'BVN is required';
                              }
                              return null;
                            },
                            controller: controller.bvnController,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Obx(
                            () => Padding(
                                padding:
                                    const EdgeInsets.only(left: 0, right: 0),
                                child: controller.listMaritalStatusModel_.value
                                        .isNotEmpty
                                    ? DropdownButtonFormField<
                                        MaritalStatusValues?>(
                                        hint: Text("Marital Status"),
                                        icon: Container(),
                                        value: controller
                                            .selectedMaritalStatusId?.value,
                                        items: controller
                                            .listMaritalStatusModel_.value
                                            .map((e) => DropdownMenuItem(
                                                  child: Text(
                                                    e.description!,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    softWrap: false,
                                                    style: TextStyle(
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  value: e,
                                                ))
                                            .toList(),
                                        onChanged: (MaritalStatusValues? val) {
                                          controller.setMaritalStatusId(val);
                                          setState(() {
                                            selectedMaritalStatus = val!.id;
                                          });
                                        },
                                        isExpanded: true,
                                        decoration: InputDecoration(
                                          suffixIcon: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 0.0),
                                            child: const Icon(
                                                Icons.keyboard_arrow_down),
                                          ),
                                          isDense: true,
                                          hintText: "Select MaritalStatus",
                                        ),
                                      )
                                    : null),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            labelText: 'Primary PhoneNo',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Phone cannot be empty";
                              }
                              if (!RegExp("^(?:[+2]0)?[0-9]{10}")
                                  .hasMatch(value)) {
                                return ("Please enter a valid phone number");
                              } else {
                                return null;
                              }
                            },
                            controller: controller.primaryPhoneController,
                          ),
                        ),
                        // gender dropdown here
                        SizedBox(
                          width: 10,
                        ),

                        Expanded(
                          child: _buildTextField(
                            labelText: 'Secondary PhoneNo',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return null;
                              }
                            },
                            controller: controller.secondaryPhoneController,
                          ),
                        ),
                      ],
                    ),
                    _buildTextField(
                      labelText: 'Contact Address',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Address Phone is required';
                        }
                        return null;
                      },
                      controller: controller.contactAddressController,
                    ),
                    Obx(
                      () => Padding(
                          padding: const EdgeInsets.only(left: 0, right: 0),
                          child: controller.listClusterModel_.value.isNotEmpty
                              ? DropdownButtonFormField<ClusterValues?>(
                                  hint: Text("Cluster"),
                                  icon: Container(),
                                  validator: (value) {
                                    if (value == null) {
                                      return "Cluster cannot be empty";
                                    }
                                    return null;
                                  },
                                  value: controller.selectedClusterId?.value,
                                  items: controller.listClusterModel_.value
                                      .map((e) => DropdownMenuItem(
                                            child: Text(
                                              e.name!,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              softWrap: false,
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            value: e,
                                          ))
                                      .toList(),
                                  onChanged: (ClusterValues? val) {
                                    controller.setClusterId(val);
                                    setState(() {
                                      selectedCluster = val!.oid;
                                      print(
                                          'selected CLUSTER $selectedCluster');
                                    });
                                  },
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(top: 0.0),
                                      child:
                                          const Icon(Icons.keyboard_arrow_down),
                                    ),
                                    isDense: true,
                                    hintText: "Select Cluster",
                                  ),
                                )
                              : null),
                    ),
                    Obx(
                      () => Padding(
                          padding: const EdgeInsets.only(left: 0, right: 0),
                          child: controller
                                  .listCooperativeModel_.value.isNotEmpty
                              ? DropdownButtonFormField<CooperativeValues?>(
                                  hint: Text("Cooperatives"),
                                  icon: Container(),
                                  value:
                                      controller.selectedCooperativeId?.value,
                                  items: controller.listCooperativeModel_.value
                                      .map((e) => DropdownMenuItem(
                                            child: Text(
                                              e.name!,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              softWrap: false,
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            value: e,
                                          ))
                                      .toList(),
                                  onChanged: (CooperativeValues? val) {
                                    controller.setCooperativeId(val);
                                    
                                    setState(() {
                                      selectedCooperative = val!.oid;
                                    });
                                  },
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(top: 0.0),
                                      child:
                                          const Icon(Icons.keyboard_arrow_down),
                                    ),
                                    isDense: true,
                                    hintText: "Select Cooperative",
                                  ),
                                )
                              : null),
                    ),
                  ],
                );
              }),
        ),
        validation: () {
          if (!controller.firstStepFormKey.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
      CoolStep(
        title: 'Select your role',
        subtitle: 'Choose your Gender and Date of Birth',
        content: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: const Text(
                'Select Gender:',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),

              
                      Padding(
                        padding: EdgeInsets.only(left: 10.h, right: 10.h),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50.h,
                          child: GridView.builder(
                            itemCount: genders.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    int collectedGender;
                                    collectedGender = index;
                                    collectedGender == 0? 1 : 2;
                                    
                                    bioGenderCurrentSelected = collectedGender;
                                    print('gender ${bioGenderCurrentSelected == 0? 1 : 2}' );
                                  });
                                },
                                child: Card(
                                  elevation: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade200,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        color: bioGenderCurrentSelected == index
                                            ? Colors.green
                                            : Colors.white),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        bioGenderCurrentSelected == index
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.only(right: 8),
                                                child: Icon(
                                                  Icons.check_box,
                                                  color: Colors.white,
                                                  size: 16.h,
                                                ),
                                              )
                                            : Container(),
                                        Text(
                                          genders[index],
                                          style: TextStyle(
                                            color:
                                                bioGenderCurrentSelected == index
                                                    ? Colors.white
                                                    : Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 4.0),
                          ),
                        ),
                      ),
              
            // Container(
            //   child: Row(
            //     children: <Widget>[
            //       _buildSelector(context: context, name: 'Male', value: 1),
            //       SizedBox(width: 5.0),
            //       _buildSelector(context: context, name: 'Female', value: 2),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: const Text(
                'Select Date of Birth:',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DatePickerWidget(
                looping: false,
                firstDate: DateTime(1930, 1, 1),
                lastDate: DateTime.now(),
                initialDate: DateTime.now(),
                dateFormat: "dd-MMM-yyyy",
                locale: DatePicker.localeFromString('en'),
                onChange: (DateTime newDateOfBirth, _) {
                  setState(() {
                    bioSelectedDateOfBirth = newDateOfBirth;
                  });
                  return controller.dateOfBirth = newDateOfBirth;
                  
                },
                pickerTheme: DateTimePickerTheme(
                  itemTextStyle: TextStyle(color: Colors.black, fontSize: 19),
                  dividerColor: Colors.green,
                ),
              ),
            ),
            SizedBox(width: 5.0),
          ],
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Account Information',
        subtitle: 'Please provide your account details',
        content: Form(
          key: controller.thirdStepFormKey,
          child: GetBuilder<FarmerController>(
              initState: maininit(),
              builder: (controller) {
                return Column(
                  children: <Widget>[
                    // old dropdown here

                    _buildTextField(
                      labelText: 'Account Name',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Account Name is required';
                        }
                        return null;
                      },
                      controller: controller.accountNameController,
                    ),

                    _buildTextField(
                      labelText: '00000123234',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Account Number is required';
                        }
                        return null;
                      },
                      controller: controller.accountNoController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownSearch<dynamic>(
                      mode: Mode.MENU,
                      items: controller.listAccountTypeModel_.value
                          .map((e) => e.name)
                          .toList(),
                      showSearchBox: true,
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Account Types",
                        hintText: "Different Account Types",
                      ),
                      onChanged: (value) {

                        var selected = controller.listAccountTypeModel_.value
                            .firstWhere((e) => e.name == value);
                        controller.setAccountTypeId(selected);
                        setState(() {
                          selectedAccountType = selected.oid;
                        });
                        print('dropdown valueeeeee ${selected.oid}');
                      },
                      selectedItem: "Select Account Type",
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    DropdownSearch<dynamic>(
                      mode: Mode.MENU,
                      items: controller.listBankModel_.value
                          .map((e) => e.name)
                          .toList(),
                      showSearchBox: true,
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Bank",
                        hintText: "Bank",
                      ),
                      onChanged: (value) {
                        var selectedBank = controller.listBankModel_.value
                            .firstWhere((e) => e.name == value);
                        controller.setBankId(selectedBank);
                        setState(() {
                          selectedAccountType = selectedBank.oid;
                        });
                        print('dropdown valueeeeee ${selectedBank.oid}');
                      },
                      selectedItem: "Select Bank",
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    _buildTextField(
                      labelText: 'Bvn Number',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return null;
                        }
                      },
                      controller: controller.bvnController,
                    ),
                  ],
                );
              }),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Location Information',
        subtitle: 'Please provide your location details',
        content: Form(
          key: controller.fourthStepFormKey,
          child: GetBuilder<FarmerController>(
              initState: maininit(),
              builder: (controller) {
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownSearch<dynamic>(
                        mode: Mode.MENU,
                        items: controller.listCountryModel_.value
                            .map((e) => e.name)
                            .toList(),
                        showSearchBox: true,
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Country",
                          hintText: "Country",
                        ),
                        onChanged: (value) {
                          var selectedCountry = controller.listCountryModel_.value
                              .firstWhere((e) => e.name == value);
                          controller.setCountryId(selectedCountry);

                         setState(() {
                          selectedAccountType = selectedCountry.oid;
                        });
                          print('dropdown value ${selectedCountry.oid}');
                        },
                        selectedItem: "Select Country",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownSearch<dynamic>(
                        mode: Mode.MENU,
                        items: controller.listStateOfOriginModel_.value
                            .map((e) => e.name)
                            .toList(),
                        showSearchBox: true,
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "State",
                          hintText: "State",
                        ),
                        onChanged: (value) {
                          var selected = controller
                              .listStateOfOriginModel_.value
                              .firstWhere((e) => e.name == value);
                          controller.setStateOfOriginId(selected);
                         setState(() {
                          selectedStateOfOriginId = selected.oid;
                         });
                          print('dropdown valueeeeee ${selected.oid}');
                        },
                        selectedItem: "Select State",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownSearch<dynamic>(
                        mode: Mode.MENU,
                        items: controller.listLocalGovernmentModel_.value
                            .map((e) => e.name)
                            .toList(),
                        showSearchBox: true,
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Local Government",
                          hintText: "Local Government",
                        ),
                        onChanged: (value) {
                          var selected = controller
                              .listLocalGovernmentModel_.value
                              .firstWhere((e) => e.name == value);
                          controller.setLocalGovernmentId(selected);
                          setState(() {
                           selectedLocalGovernmentId = selected.oid;
                          });
                          print('dropdown value ${selected.oid}');
                        },
                        selectedItem: "Select LGA",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildTextField(
                        labelText: 'Others',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Others is required';
                          }
                          return null;
                        },
                        controller: null,
                      ),
                    ),
                  ],
                );
              }),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Means Of Identification (ID)',
        subtitle: 'Please provide your identity details',
        content: Form(
          key: controller.fifthStepFormKey,
          child: GetBuilder<FarmerController>(
              initState: maininit(),
              builder: (controller) {
                return Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Expiry Date:',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DatePickerWidget(
                        looping: false,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030, 1, 1),
                        initialDate: DateTime.now(),
                        dateFormat: "dd-MMM-yyyy",
                        locale: DatePicker.localeFromString('en'),
                        onChange: (DateTime newDate, _) =>
                            controller.dateOfBirth = newDate,
                        pickerTheme: DateTimePickerTheme(
                          itemTextStyle:
                              TextStyle(color: Colors.black, fontSize: 19),
                          dividerColor: Colors.green,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownSearch<dynamic>(
                        mode: Mode.MENU,
                        items: controller.listIdentityTypeModel_.value
                            .map((e) => e.name)
                            .toList(),
                        showSearchBox: true,
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Identity Type",
                          hintText: "Identity Type",
                        ),
                        onChanged: (value) {
                          var selected = controller.listIdentityTypeModel_.value
                              .firstWhere((e) => e.name == value);
                          controller.setIdentityTypeId(selected);
                         setState(() {
                          selectedIdentityType = selected.oid;
                        });
                          print('dropdown value ${selected.oid}');
                        },
                        selectedItem: "Select IdentityType",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildTextField(
                        labelText: 'Identification No',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Identification No is required';
                          }
                          return null;
                        },
                        controller: controller.idNumberController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildTextField(
                        labelText: 'Issuing Body',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Issuing Body is required';
                          }
                          return null;
                        },
                        controller: null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildTextField(
                        labelText: 'Place Of Issue',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return null;
                          }
                        },
                        controller: controller.placeOfIssueController,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Issuing Date:',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DatePickerWidget(
                        looping: false,
                        firstDate: DateTime(2019, 1, 1),
                        lastDate: DateTime.now(),
                        initialDate: DateTime.now(),
                        dateFormat: "dd-MMM-yyyy",
                        locale: DatePicker.localeFromString('en'),
                        onChange: (DateTime issuingDate, _) {
                          selectedIssuingDate = issuingDate;
                          return controller.dateOfBirth = issuingDate;
                        },
                        pickerTheme: DateTimePickerTheme(
                          itemTextStyle:
                              TextStyle(color: Colors.black, fontSize: 19),
                          dividerColor: Colors.green,
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Nationality',
        subtitle: 'Please provide your nationality details',
        content: Form(
          key: controller.sixthStepFormKey,
          child: GetBuilder<FarmerController>(
              initState: maininit(),
              builder: (controller) {
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownSearch<dynamic>(
                        mode: Mode.MENU,
                        items: controller.listCountryModel_.value
                            .map((e) => e.name)
                            .toList(),
                        showSearchBox: true,
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Country Nationality",
                          hintText: "Country Nationality",
                        ),
                        onChanged: (value) {
                          var selected = controller.listCountryModel_.value
                              .firstWhere((e) => e.name == value);
                          controller.setCountryId(selected);
                          setState(() {
                            selectedNationalityCountryId = selected.oid;
                          });
                          print('dropdown value ${selected.oid}');
                        },
                        selectedItem: "Select Country Nationality",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownSearch<dynamic>(
                        mode: Mode.MENU,
                        items: controller.listStateOfOriginModel_.value
                            .map((e) => e.name)
                            .toList(),
                        showSearchBox: true,
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "State Nationality",
                          hintText: "State Nationality",
                        ),
                        onChanged: (value) {
                          var selected = controller
                              .listStateOfOriginModel_.value
                              .firstWhere((e) => e.name == value);
                          controller.setStateOfOriginId(selected);
                          setState(() {
                            selectedNationalityStateId = selected.oid;
                          });
                          print('dropdown valueeeeee ${selected.oid}');
                        },
                        selectedItem: "Select State Nationality",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownSearch<dynamic>(
                        mode: Mode.MENU,
                        items: controller.listLocalGovernmentModel_.value
                            .map((e) => e.name)
                            .toList(),
                        showSearchBox: true,
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "LocalGovernment Nationality+",
                          hintText: "LocalGovernment Nationality+",
                        ),
                        onChanged: (value) {
                          var selected = controller
                              .listLocalGovernmentModel_.value
                              .firstWhere((e) => e.name == value);
                          controller.setLocalGovernmentId(selected);
                          setState(() {
                            selectedNationalityLocalGovernmentId = selected.oid;
                          });
                          print('dropdown value ${selected.oid}');
                        },
                        selectedItem: "Select LocalGovernment Nationality",
                      ),
                    ),
                  ],
                );
              }),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Next of Kin (NOK) Information',
        subtitle: 'Please fill Next of Kin Details',
        content: Form(
          key: controller.sevenththStepFormKey,
          child: GetBuilder<FarmerController>(
              initState: maininit(),
              builder: (controller) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            labelText: 'First Name',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'FirstName is required';
                              }
                              return null;
                            },
                            controller: controller.nokFirstName,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: _buildTextField(
                            labelText: 'Middle Name',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return null;
                              }
                            },
                            controller: controller.nokMiddleName,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            labelText: 'Last Name',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'LastName is required';
                              }
                              return null;
                            },
                            controller: controller.nokLastName,
                          ),
                        ),
                        // gender dropdown here
                        SizedBox(
                          width: 10,
                        ),

                        Expanded(
                          child: _buildTextField(
                            labelText: 'example@mail.com',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email address is required';
                              }
                              return null;
                            },
                            controller: controller.nokEmail,
                          ),
                        ),
                      ],
                    ),
                    _buildTextField(
                      labelText: 'BVN',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'BVN is required';
                        }
                        return null;
                      },
                      controller: controller.nokBvn,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Select NOK Gender:',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          _buildSelector(
                              context: context, name: 'Male', value: 1),
                          SizedBox(width: 5.0),
                          _buildSelector(
                              context: context, name: 'Female', value: 2),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            labelText: 'Primary PhoneNo',
                            controller: controller.nokPrimaryPhone,
                          ),
                        ),
                        // gender dropdown here
                        SizedBox(
                          width: 10,
                        ),

                        Expanded(
                          child: _buildTextField(
                            labelText: 'Secondary PhoneNo',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return null;
                              }
                            },
                            controller: controller.nokSecondaryPhone,
                          ),
                        ),
                      ],
                    ),
                    _buildTextField(
                      labelText: 'Contact Address',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Address Phone is required';
                        }
                        return null;
                      },
                      controller: controller.nokContactAddress,
                    ),
                    Obx(
                      () => Padding(
                          padding: const EdgeInsets.only(left: 0, right: 0),
                          child: controller
                                  .listRelationshipTypeModel_.value.isNotEmpty
                              ? DropdownButtonFormField<
                                  RelationshipTypeValues?>(
                                  hint: Text("Relationship"),
                                  icon: Container(),
                                  value: controller
                                      .selectedRelationshipTypeId?.value,
                                  items: controller
                                      .listRelationshipTypeModel_.value
                                      .map((e) => DropdownMenuItem(
                                            child: Text(
                                              e.name!,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              softWrap: false,
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            value: e,
                                          ))
                                      .toList(),
                                  onChanged: (RelationshipTypeValues? val) {
                                      setState(() {
                                        selectedNokRelationshipType = val!.oid;
                                      });
                                    controller.setRelationshipTypeId(val);
                                  },
                                  isExpanded: true,
                                  decoration: InputDecoration(
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(top: 0.0),
                                      child:
                                          const Icon(Icons.keyboard_arrow_down),
                                    ),
                                    isDense: true,
                                    hintText: "Select Relationship Type",
                                  ),
                                )
                              : null),
                    ),
                    DropdownSearch<dynamic>(
                      mode: Mode.MENU,
                      items: controller.listStateOfOriginModel_.value
                          .map((e) => e.name)
                          .toList(),
                      showSearchBox: true,
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Nok State",
                        hintText: "Nok State",
                      ),
                      onChanged: (value) {
                        var selected = controller.listStateOfOriginModel_.value
                            .firstWhere((e) => e.name == value);
                        controller.setStateOfOriginId(selected);
                          setState(() {
                            selectedNokStateId = selected.oid;
                          });
                        print('dropdown valueeeeee ${selected.oid}');
                      },
                      selectedItem: "Select State",
                    ),
                  ],
                );
              }),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Spouse Information',
        subtitle: 'Please fill Spouse Details',
        content: Form(
          key: controller.eightStepFormKey,
          child: GetBuilder<FarmerController>(
              initState: maininit(),
              builder: (controller) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            labelText: 'First Name',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return null;                               return null;
;
                              }
                            },
                            controller: controller.spouse_firstName,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: _buildTextField(
                            labelText: 'Middle Name',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return null;
                              }
                            },
                            controller: controller.spouse_middleName,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            labelText: 'Last Name',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return null;
                              }
                              return null;
                            },
                            controller: controller.spouse_lastName,
                          ),
                        ),
                        // gender dropdown here
                        SizedBox(
                          width: 10,
                        ),

                        Expanded(
                          child: _buildTextField(
                            labelText: 'example@mail.com',
                            validator: (value) {
                              if (value!.isEmpty) {
                                 return null;

                              }
                              return null;
                            },
                            controller: controller.spouse_email,
                          ),
                        ),
                      ],
                    ),
                    _buildTextField(
                      labelText: 'BVN',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'BVN is required';
                        }
                        return null;
                      },
                      controller: controller.spouse_bvn,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Select Spouse Gender:',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          _buildSelector(
                              context: context, name: 'Male', value: 1),
                          SizedBox(width: 5.0),
                          _buildSelector(
                              context: context, name: 'Female', value: 2),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField(
                            labelText: 'Primary PhoneNo',
                            validator: (value) {
                              if (value!.isEmpty) {
                                  return null;

                              }
                              return null;
                            },
                            controller: controller.spouse_primaryPhone,
                          ),
                        ),
                        // gender dropdown here
                        SizedBox(
                          width: 10,
                        ),

                        Expanded(
                          child: _buildTextField(
                            labelText: 'Secondary PhoneNo',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return null;
                              }
                            },
                            controller: controller.spouse_secondaryPhone,
                          ),
                        ),
                      ],
                    ),
                    _buildTextField(
                      labelText: 'Contact Address',
                      validator: (value) {
                        if (value!.isEmpty) {
                           return null;
                        }
                        return null;
                      },
                      controller: controller.spouse_residentialAddress,
                    ),
                   
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 60.0,
                      child: ElevatedButton(
                        onPressed: () {
                          //  print('complete');

                          _createProfile(context, controller);
                        },
                        child: const Text(
                          'Create Profile',
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.normal),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ),
        validation: () {
          if (!controller.eightStepFormKey.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;

          //_createProfile(context, controller);
        },
      ),
    ];

    final stepper = CoolStepper(
      showErrorSnackbar: false,
      onCompleted: () {
        print('Steps completed!');
      },
      steps: steps,
      config: CoolStepperConfig(
        backText: 'PREV',
        // finalText: ''
      ),
    );

    return WillPopScope(
      onWillPop: () => showExitToLandingPopup(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Update Profile'),
        ),
        body: Container(
          //todo: replace with controller value

          child: isLoading == true
              ? Center(
                  child: SpinKitDualRing(
                    color: Colors.green,
                    lineWidth: 2,
                  ),
                )
              : stepper,
        ),
      ),
    );
  }

  //the Text Input
  Widget _buildTextField({
    String? labelText,
    bool? readonly,
    FormFieldValidator<String>? validator,
    TextEditingController? controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
        ),
        validator: validator,
        controller: controller,
        readOnly: readonly ?? false,
      ),
    );
  }

  //bio gender
  Widget _buildSelector({
    BuildContext? context,
    required String name,
    required int value,
  }) {
    final isActive = name == selectedGender;
    return Expanded(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context!).primaryColor : null,
          border: Border.all(width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: FormField(
          builder: (FormFieldState<bool> state) {
            return RadioListTile(
              value: name,
              activeColor: Colors.white,
              groupValue:
                  selectedGender == 'Male' ? 1.toString() : 2.toString(),
              onChanged: (String? v) {
                setState(() {
                  selectedGender = v;
                    bioSelectedGender = selectedGender == 'Male' ? 1.toString() : 2.toString();

                  print(
                      'selected-gender $bioSelectedGender');
                });
              },
              title: Text(
                name,
                style: TextStyle(
                  color: isActive ? Colors.white : null,
                ),
              ),
            );
          },
          validator: (value) {
            if (value != true) {
              return 'Please Select gender';
            }
            return null;
          },
        ),
      ),
    );
  }

//next of kin gender 
    Widget _buildNokGenderSelector({
    BuildContext? context,
    required String name,
    required int value,
  }) {
    final isActive = name == nokGender;
    return Expanded(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context!).primaryColor : null,
          border: Border.all(width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: FormField(
          builder: (FormFieldState<bool> state) {
            return RadioListTile(
              value: name,
              activeColor: Colors.white,
              groupValue:
                  nokGender == 'Male' ? 1.toString() : 2.toString(),
              onChanged: (String? v) {
                setState(() {
                  nokGender = v;
                  selectedNokGender = nokGender == 'Male' ? 1.toString() : 2.toString();
                  print(
                      'selected-gender $selectedNokGender');
                });
              },
              title: Text(
                name,
                style: TextStyle(
                  color: isActive ? Colors.white : null,
                ),
              ),
            );
          },
          validator: (value) {
            if (value != true) {
              return 'Please Select gender';
            }
            return null;
          },
        ),
      ),
    );
  }

//spouse gender
    Widget _buildSpouseGenderSelector({
    BuildContext? context,
    required String name,
    required int value,
  }) {
    final isActive = name == selectedGender;
    return Expanded(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context!).primaryColor : null,
          border: Border.all(width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: FormField(
          builder: (FormFieldState<bool> state) {
            return RadioListTile(
              value: name,
              activeColor: Colors.white,
              groupValue:
                  selectedGender == 'Male' ? 1.toString() : 2.toString(),
              onChanged: (String? v) {
                setState(() {
                  selectedGender = v;
                  print(
                      'selected-gender ${selectedGender == 'Male' ? 1.toString() : 2.toString()}');
                });
              },
              title: Text(
                name,
                style: TextStyle(
                  color: isActive ? Colors.white : null,
                ),
              ),
            );
          },
          validator: (value) {
            if (value != true) {
              return 'Please Select gender';
            }
            return null;
          },
        ),
      ),
    );
  }

  maininit() {
    print("here");
    Get.put<FarmerController>(
        FarmerController(FarmerRepository(ApiServiceProvider())));
  }

  bool isItemDisabled(String s) {
    //return s.startsWith('I');

    if (s.startsWith('I')) {
      return true;
    } else {
      return false;
    }
  }

  void itemSelectionChanged(String? s) {
    print(s);
  }

  void _createProfile(BuildContext context, FarmerController controller) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = (prefs.getString('username') ?? '');
   
    String _bioFirstName = controller.firstNameController.text.trim();
    String _bioMiddleName = controller.middleNameController.text.trim();
    String _bioLastName = controller.lastNameController.text.trim();
    var _bioGender = 1 ; //todo
    String _bioEmail = controller.emailController.text.trim();
     var _bioDob = bioSelectedDateOfBirth;
     //var _applicantId = 0000001; //todo
    String _bioBvn = controller.bvnController.text.trim();
    String _bioPrimaryPhone = controller.primaryPhoneController.text.trim();
    String _bioSecondaryPhone = controller.secondaryPhoneController.text.trim();
    var _seasonOid = 1; //todo
    var _clusterOid = selectedCluster;
    var _cooperativeOid = selectedCooperative;
     String _bioContactAddress = controller.contactAddressController.text.trim();
    // var photo = 0;
     var _cooperativeMembershipStatus = 0;
     var _maritalStatus = selectedMaritalStatus;
     var _onBoardingType = 2;

    //Account Details
    String _accountName = controller.accountNameController.text.trim();
    String _accountNo = controller.accountNoController.text.trim();
    var _accountType = selectedAccountType;
    var _bankOid = selectedBankId;
    String _accountBvn = controller.accountBvnController.text.trim();

    //Location Details
    var _countryLocationOid = selectedCountryId;
    var _stateLocationOid = selectedStateOfOriginId;
    var _localGovernmentLocationOid = selectedLocalGovernmentId;
    String _locationOthers = controller.othersController.text.trim();

    //means Of Identification
    var _moiExpiryDate = selectedExpiryDate;
    var _moiIdentityTypeOid = selectedIdentityType;
    String _moiIdNo = controller.idNumberController.text.trim();
    String _moiIssuingBody = controller.issuingBody.text.trim();
    var _moiIssuingDate = selectedIssuingDate;
    String _moiPlaceOfIssuing = controller.placeOfIssueController.text.trim();

    //Nationality
    var _countryNationalityOid = selectedNationalityCountryId;
    var _stateNationalityOid = selectedNationalityStateId;
    var _localGovernmentNationalityOid = selectedLocalGovernmentId;

    //nextOfKin
    String _nokBvn = controller.nokBvn.text.trim();
    String _nokContactAddress = controller.nokContactAddress.text.trim();
    String _nokEmail = controller.nokEmail.text.trim();
    String _nokFirstName = controller.nokFirstName.text.trim();
    String _nokMiddleName = controller.nokMiddleName.text.trim();
    String _nokLastName = controller.nokLastName.text.trim();
    String _nokPrimaryPhone = controller.nokPrimaryPhone.text.trim();
    String _nokSecondaryPhone = controller.nokSecondaryPhone.text.trim();
    var _nokStateOid = selectedNokStateId;
    var _nokRelationshipType = selectedNokRelationshipType;

    // //Spouse details

    String _spouseBvn = controller.spouse_bvn.text.trim();
    String _spouseEmail = controller.spouse_email.text.trim();
    String _spouseFirstName = controller.spouse_firstName.text.trim();
    String _spouseMiddleName = controller.spouse_middleName.text.trim();
    String _spouseLastName = controller.spouse_lastName.text.trim();
    String _spousePrimaryPhone = controller.spouse_primaryPhone.text.trim();
    String _spouseContactAddress =  controller.spouse_residentialAddress.text.trim();
    String _spouseSecondaryPhone = controller.spouse_secondaryPhone.text.trim();
    var _spouseStateOid = selectedSpouseStateId;

    var addFarmerData = {
      'titleOid': 1,
      'firstName': _bioFirstName,
      'middleName': _bioMiddleName,
      'lastName': _bioLastName,
      'gender': 1,
      'email': _bioEmail,
      'dateOfBirth': _bioDob,
      'applicantId': 0,
      'bvn': _bioBvn,
      'primaryPhone': _bioPrimaryPhone,
      'secondaryPhone': _bioSecondaryPhone,
      'seasonOid': 0,
      'assignedAgentOid': 0,
      'clusterOid': _clusterOid,
      'cooperativeOid': _cooperativeOid,
      'contactAddress': _bioContactAddress,
      'photo': '',
      'cooperativeMembershipStatus': 0,
      'maritalStatus': _maritalStatus,
      'onBoardingType': _onBoardingType,
      'accountDetails': {
        'accountName': _accountName,
        'accountNo': _accountNo,
        'accountTypeOid': _accountType,
        'bankOid': _bankOid,
        'bvn': _accountBvn,
        'createdBy': username,
        'createdOn': DateTime.now(),
        'pcDomainName': '',
        'pcIpAddress': '',
        'pcName': '',
        'pcUserName': ''
      },
      'location': {
        'countryOid': _countryLocationOid,
        'stateOid': _stateLocationOid,
        'localGovernmentOid': _localGovernmentLocationOid,
        'others': _locationOthers,
        'createdBy': username,
        'createdOn': DateTime.now(),
        'pcDomainName': '',
        'pcIpAddress': '',
        'pcName': '',
        'pcUserName': ''
      },
      'meansOfIdentification': {
        'expiryDate': _moiExpiryDate,
        'identityTypeOid': _moiIdentityTypeOid,
        'idNo': _moiIdNo,
        'issuingBody': _moiIssuingBody,
        'issuingDate': _moiIssuingDate,
        'placeOfIssue': _moiPlaceOfIssuing,
        'createdBy': username,
        'createdOn': DateTime.now(),
        'pcDomainName': '',
        'pcIpAddress': '',
        'pcName': '',
        'pcUserName': ''
      },
      'nationality': {
        'countryOid': _countryNationalityOid,
        'stateOid': _stateNationalityOid,
        'localGovernmentOid': _localGovernmentNationalityOid,
        'districtOid': 0,
        'wardOid': 0,
        'createdBy': username,
        'createdOn': DateTime.now(),
        'pcDomainName': '',
        'pcIpAddress': '',
        'pcName': '',
        'pcUserName': ''
      },
      'nextOfKin': {
        'bvn': _nokBvn,
        'contactAddress': _nokContactAddress,
        'email': _nokEmail,
        'firstName': _nokFirstName,
        'gender': 1,
        'lastName': _nokLastName,
        'middleName': _nokMiddleName,
        'name': '',
        'primaryPhone': _nokPrimaryPhone,
        'relationshipTypeOid': _nokRelationshipType,
        'secondaryPhone': _nokSecondaryPhone,
        'stateOid': _nokStateOid,
        'createdBy': username,
        'createdOn': DateTime.now(),
        'pcDomainName': '',
        'pcIpAddress': '',
        'pcName': '',
        'pcUserName': ''
      },
      'spouse': {
        'bvn': _spouseBvn,
        'email': _spouseEmail,
        'firstName': _spouseFirstName,
        'gender': 1,
        'lastName': _spouseLastName,
        'middleName': _spouseMiddleName,
        'primaryPhone': _spousePrimaryPhone,
        'residentialAddress': _spouseContactAddress,
        'secondaryPhone': _spouseSecondaryPhone,
        'stateOid': _spouseStateOid,
      'createdBy': username,
        'createdOn': DateTime.now(),
        'pcDomainName': '',
        'pcIpAddress': '',
        'pcName': '',
        'pcUserName': ''
      },
      'createdBy': username,
      'createdOn': DateTime.now(),
      'pcDomainName': '',
      'pcIpAddress': '',
      'pcName': '',
      'pcUserName': '',
      'userName': ''
    };

    print('farmer data $addFarmerData');
    // ignore: void_checks
    return await controller.createProfile(context, controller);

    // CreateProfile signUpBody = CreateProfile(
    //     userName: _userName,
    //     email: _email,
    //     password: _password,
    //     phoneNo: _phoneNo,
    //     userType: userTypesCurrentSelected,
    //     pcDomainName: '',
    //     pcIpAddress: '',
    //     pcName: '',
    //     pcUserName: '');
    // controller.registration(signUpBody, context).then((status) async {
    //   if (status.isSuccess) {
    //     showCustomSnackBar(status.message);
    //   } else {
    //     showCustomSnackBar(status.message);
    //   }
    //  }
    // );
    //await controller.createProfile(context);
  }
}
