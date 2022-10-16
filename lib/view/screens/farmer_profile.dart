// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:cool_stepper/cool_stepper.dart';
import 'package:dcms_app/models/account_type.dart';
import 'package:dcms_app/models/cluster.dart';
import 'package:dcms_app/models/title.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import '../../controller/farmer_controller.dart';
import '../../core/api_service_provider.dart';
import '../../models/cooperative.dart';
import '../../models/marital_status.dart';
import '../../respository/farmer_repository.dart';
import 'components/exit_pop.dart';

class FarmerProfile extends StatefulWidget {
  FarmerProfile({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _FarmerProfileState createState() => _FarmerProfileState();
}

class _FarmerProfileState extends State<FarmerProfile> {
  final controller =
      Get.put(FarmerController(FarmerRepository(ApiServiceProvider())));

  String? selectedGender = 'Agent';

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
                                return 'Email address is required';
                              }
                              return null;
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
                                padding: const EdgeInsets.only(left: 0, right: 0),
                                child: controller.listMaritalStatusModel_.value.isNotEmpty
                                    ? DropdownButtonFormField<MaritalStatusValues?>(
                                        hint: Text("Marital Status"),
                                        icon: Container(),
                                        value: controller.selectedMaritalStatusId?.value,
                                        items: controller.listMaritalStatusModel_.value
                                            .map((e) => DropdownMenuItem(
                                                  child: Text(
                                                    e.description!,
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
                                    onChanged: (MaritalStatusValues? val) {
                                      controller.setMaritalStatusId(val);
                                    },
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(top: 0.0),
                                        child:
                                            const Icon(Icons.keyboard_arrow_down),
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
                                return 'Primary Phone is required';
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
                            labelText: 'Secondary PhoneNo',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return null;
                              }
                            },
                            controller: controller.emailController,
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
                      controller: controller.emailController,
                    ),

                    
                    Obx(
                      () => Padding(
                          padding: const EdgeInsets.only(left: 0, right: 0),
                          child: controller.listClusterModel_.value.isNotEmpty
                              ? DropdownButtonFormField<ClusterValues?>(
                                  hint: Text("Cluster"),
                                  icon: Container(),
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
                          child: controller.listCooperativeModel_.value.isNotEmpty
                              ? DropdownButtonFormField<CooperativeValues?>(
                                  hint: Text("Cooperatives"),
                                  icon: Container(),
                                  value: controller.selectedCooperativeId?.value,
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
        subtitle: 'Choose a role that better defines you',
        content: Form(
          key: controller.secondStepFormKey,
          child: Column(
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
              Container(
                child: Row(
                  children: <Widget>[
                    _buildSelector(context: context, name: 'Male', value: 1),
                    SizedBox(width: 5.0),
                    _buildSelector(context: context, name: 'Female', value: 2),
                  ],
                ),
              ),
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
                  onChange: (DateTime newDate, _) =>
                      controller.dateOfBirth = newDate,
                  pickerTheme: DateTimePickerTheme(
                    itemTextStyle: TextStyle(color: Colors.black, fontSize: 19),
                    dividerColor: Colors.green,
                  ),
                ),
              ),
              SizedBox(width: 5.0),


            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Accoount Information',
        subtitle: 'Please provide your account details',
        content: Form(
          key: controller.fourthStepFormKey,
          child: GetBuilder<FarmerController>(
              initState: maininit(),
              builder: (controller) {
              return Column(
                children: <Widget>[
          
                  // DropdownSearch<AccountTypeValues>(
                  //   mode: Mode.MENU,
                  //   //showSelectedItems: true,
                  //   items: controller.listAccountTypeModel_.value,

                  //   dropdownSearchDecoration: InputDecoration(
                  //     labelText: "Account Types",
                  //     hintText: "Different Account Type",
                  //   ),
                  //   onChanged: (AccountTypeValues? val) {
                  //         controller.setAccountTypeId(val);
                  //   }, 
                  //   //AccountTypeValues,
                  //   //selectedItem: "",
                  //   showSearchBox: true,
                  //   searchFieldProps: TextFieldProps(
                  //     cursorColor: Colors.green,
                  //   ),
                  // ),
                

                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownSearch<dynamic>(
                        mode: Mode.MENU,
                        items: controller.listAccountTypeModel_.value.map((e) => e.name).toList(),
                        showSearchBox: true,
                         dropdownSearchDecoration: InputDecoration(
                          labelText: "Account Types",
                          hintText: "Different Account Types",
                        ),
                        onChanged: ( value) {
                          print('dropdown value');
                          controller.setAccountTypeId(value);
                        },
                        selectedItem: "Savings",
                      ),
                    ),
                
                ],
              );
            }
          ),
        ),
        validation: () {
          return null;
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
      ),
    );

    return WillPopScope(
      onWillPop: () => showExitToLandingPopup(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Add Farmer'),
        ),
        body: Container(
          child: stepper,
        ),
      ),
    );
  }

  //the Text Input
  Widget _buildTextField({
    String? labelText,
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
      ),
    );
  }

  //the Button selection
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
        child: RadioListTile(
          value: name,
          activeColor: Colors.white,
          groupValue: selectedGender == 'Male' ? 1.toString() : 2.toString(),
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
}
