// ignore_for_file: prefer_const_constructors


import 'package:dcms_app/models/bank.dart';
import 'package:dcms_app/models/cluster.dart';
import 'package:dcms_app/respository/farmer_repository.dart';
import 'package:dcms_app/routes/base.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/api_service_provider.dart';
import '../models/account_type.dart';
import '../models/cooperative.dart';
import '../models/country.dart';
import '../models/identity_type.dart';
import '../models/lga.dart';
import '../models/marital_status.dart';
import '../models/relationship_type.dart';
import '../models/state_of_origin.dart';
import '../models/title.dart';
import '../routes/endpoints.dart';
import '../utils/app_snacks.dart';

class FarmerController extends GetxController with StateMixin<List<dynamic>> {
  var isDataProcessing = false.obs;
  FarmerRepository repository;
  late SharedPreferences _prefs;
  FarmerController(this.repository);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
 
  GlobalKey<FormState> transactionFormKey = GlobalKey<FormState>();

  final firstStepFormKey = GlobalKey<FormState>();

  final secondStepFormKey = GlobalKey<FormState>();

  final thirdStepFormKey = GlobalKey<FormState>();

  final fourthStepFormKey = GlobalKey<FormState>();

  final fifthStepFormKey = GlobalKey<FormState>();

  final sixthStepFormKey = GlobalKey<FormState>();

  final sevenththStepFormKey = GlobalKey<FormState>();

  final eightStepFormKey = GlobalKey<FormState>();


  //title
  late TextEditingController firstNameController;
  late TextEditingController middleNameController;
  late TextEditingController lastNameController;
  //gender
  late TextEditingController emailController;
  late DateTime dateOfBirth;
  late TextEditingController applicantIdController;
  late TextEditingController bvnController;
  late TextEditingController primaryPhoneController;
  late TextEditingController secondaryPhoneController;
  // seasonoid
  // assignedAgent
  // clusteroid
  // cooperativeoid
  late TextEditingController contactAddressController;
  // photo
  // cooperativemembershipstatus
  // martialstatus
  // onboardingtype

  //Account details
   late TextEditingController accountNameController;
   late TextEditingController accountNoController;
    // accountType
    // bankOid
   late  TextEditingController accountBvnController;

  //location 
  // countryoid -- stateoid -- lgaoid
   late TextEditingController othersController;

  //means of Identification 
  late TextEditingController idNumberController;
  late TextEditingController issuingBody;
  late TextEditingController placeOfIssueController;
  late dynamic _selectedMeansOfIdentification = 1;

  //nationality
  //countryoid
  //stateoid
  //localgovernmentoid 

  //Next of kin details
  late TextEditingController nokFirstName;
  late TextEditingController nokMiddleName;
  late TextEditingController nokLastName;
  late TextEditingController nokEmail;
  late TextEditingController nokBvn;
  late TextEditingController nokContactAddress;
  late TextEditingController nokPrimaryPhone;
  late TextEditingController nokSecondaryPhone;

  //spouse details

  // Spouse Info
  late TextEditingController spouse_firstName;
  late TextEditingController spouse_middleName;
  late TextEditingController spouse_lastName;
  late TextEditingController spouse_email;
  late TextEditingController spouse_bvn;
  late TextEditingController spouse_residentialAddress;
  late TextEditingController spouse_primaryPhone;
  late TextEditingController spouse_secondaryPhone;
  dynamic spouse_selectedGender = 1;

    void onInit() {
    super.onInit();
     //title
     firstNameController = TextEditingController();
     middleNameController = TextEditingController();
     lastNameController = TextEditingController();
     emailController = TextEditingController();
     applicantIdController = TextEditingController();
     bvnController = TextEditingController();
     primaryPhoneController = TextEditingController();
     secondaryPhoneController = TextEditingController();
     contactAddressController = TextEditingController();
     
     //Accout Details
     accountNameController = TextEditingController();
     accountNoController = TextEditingController();
     //accountType
     //bankOid
     accountBvnController = TextEditingController();

     //Location Details
      // countryoid -- stateoid -- lgaoid
      othersController = TextEditingController();


     //Means of identification
     //identitytypeoid
     idNumberController = TextEditingController();
     issuingBody = TextEditingController();
     //issuingDate
     placeOfIssueController = TextEditingController();
     //expirarydate


    
  
     //Next of kin details
     nokFirstName = TextEditingController();
     nokMiddleName = TextEditingController();
     nokLastName = TextEditingController();
     nokEmail = TextEditingController();
     nokBvn = TextEditingController();
     nokContactAddress = TextEditingController();
     nokPrimaryPhone = TextEditingController();
     nokSecondaryPhone = TextEditingController();
 
     //spouse
     spouse_firstName = TextEditingController();
     spouse_middleName = TextEditingController();
     spouse_lastName = TextEditingController();
     spouse_email = TextEditingController();
     spouse_bvn = TextEditingController();
     spouse_residentialAddress = TextEditingController();
     spouse_primaryPhone = TextEditingController();
     spouse_secondaryPhone = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
    loadResources (); 
  }

  Future <void> loadResources () async {
    getStateOfOrigin(Endpoints.getAllStates);
    getTitles(Endpoints.getAllTitles);
    getClusters(Endpoints.getAllCluters);
    // getCooperatives(Endpoints.getAllCooperatives);
    getMaritalStatus(Endpoints.getAllMaritalStatus);
    getAccountType(Endpoints.getAccountTypes);
    getBank(Endpoints.getAllBanks);
    getCountry(Endpoints.getAllCountries);
    getIdentityType(Endpoints.getAllIdentityTypes);
    getRelationshipType(Endpoints.getRelationshipTypes);
  }
  @override
  void onClose() {
    super.onClose();
 
     firstNameController.dispose();
     middleNameController.dispose();
     lastNameController.dispose();
     emailController.dispose();
     applicantIdController.dispose();
     bvnController.dispose();
     primaryPhoneController.dispose();
     secondaryPhoneController.dispose();
     contactAddressController.dispose();
     
     othersController.dispose();
     //Accout Details
     accountNameController.dispose();
     accountNoController.dispose();
     accountBvnController.dispose();

     //Means of identification
     idNumberController.dispose();
     issuingBody.dispose();
  
     //Next of kin details
     nokFirstName.dispose();
     nokMiddleName.dispose();
     nokLastName.dispose();
     nokEmail.dispose();
     nokBvn.dispose();
     nokContactAddress.dispose();
     nokPrimaryPhone.dispose();
     nokSecondaryPhone.dispose();
 
     //spouse
     spouse_firstName.dispose();
     spouse_middleName.dispose();
     spouse_lastName.dispose();
     spouse_email.dispose();
     spouse_bvn.dispose();
     spouse_residentialAddress.dispose();
     spouse_primaryPhone.dispose();
     spouse_secondaryPhone.dispose();
  }



  //---------------Title dropdown begining

  Rx<List<Values>> listTitleModel_ = Rx<List<Values>>([]);
  Rx<Values>? _selectedTitleId;
  Rx<Values>? get selectedTitleId => _selectedTitleId;

  setTitleId(Values? value) {
    print("setTitleId");

    refresh();
    print("done setTitleId");
  }

  Rx<List<DropdownMenuItem<String>>> listTitleDropDownMenuItem =
      Rx<List<DropdownMenuItem<String>>>([]);
  // --------------end of Title dropdown

  //---------------Cluster dropdown begining

  Rx<List<ClusterValues>> listClusterModel_ = Rx<List<ClusterValues>>([]);
  Rx<ClusterValues>? _selectedClusterId;
  Rx<ClusterValues>? get selectedClusterId => _selectedClusterId;

  setClusterId(ClusterValues? value) {
    print("setClusterId");

    refresh();
    print("done setClusterId");
  }

  Rx<List<DropdownMenuItem<String>>> listClusterDropDownMenuItem =
      Rx<List<DropdownMenuItem<String>>>([]);
  // --------------end of Cluster dropdown

  //---------------Cooperative dropdown begining

  Rx<List<CooperativeValues>> listCooperativeModel_ =
      Rx<List<CooperativeValues>>([]);
  Rx<CooperativeValues>? _selectedCooperativeId;
  Rx<CooperativeValues>? get selectedCooperativeId => _selectedCooperativeId;

  setCooperativeId(CooperativeValues? value) {
    print("setCooperativeId");

    refresh();
    print("done setCooperativeId");
  }

  Rx<List<DropdownMenuItem<String>>> listCooperativeDropDownMenuItem =
      Rx<List<DropdownMenuItem<String>>>([]);
// --------------end of Cooperative dropdown

//---------------MaritalStatus dropdown begining

  Rx<List<MaritalStatusValues>> listMaritalStatusModel_ =
      Rx<List<MaritalStatusValues>>([]);
  Rx<MaritalStatusValues>? _selectedMaritalStatusId;
  Rx<MaritalStatusValues>? get selectedMaritalStatusId =>
      _selectedMaritalStatusId;

  setMaritalStatusId(MaritalStatusValues? value) {
    print("setMaritalStatusId");

    refresh();
    print("done setMaritalStatusId");
  }

  Rx<List<DropdownMenuItem<String>>> listMaritalStatusDropDownMenuItem =
      Rx<List<DropdownMenuItem<String>>>([]);
  // --------------end of MaritalStatus dropdown

//---------------AccountType dropdown begining

  Rx<List<AccountTypeValues>> listAccountTypeModel_ =
      Rx<List<AccountTypeValues>>([]);
  Rx<AccountTypeValues>? _selectedAccountTypeId;
  Rx<AccountTypeValues>? get selectedAccountTypeId => _selectedAccountTypeId;

  setAccountTypeId(AccountTypeValues? value) {
    print("setAccountTypeId ${value!.oid}");

    refresh();
    print("done setAccountTypeId");
  }

  Rx<List<DropdownMenuItem<String>>> listAccountTypeDropDownMenuItem =
      Rx<List<DropdownMenuItem<String>>>([]);
  // --------------end of AccountType dropdown

  //---------------Bank dropdown begining

  Rx<List<BankValues>> listBankModel_ = Rx<List<BankValues>>([]);
  Rx<BankValues>? _selectedBankId;
  Rx<BankValues>? get selectedBankId => _selectedBankId;

  setBankId(BankValues? value) {
    print("setBankId ${value!.oid}");

    refresh();
    print("done setBankId");
  }

  Rx<List<DropdownMenuItem<String>>> listBankDropDownMenuItem =
      Rx<List<DropdownMenuItem<String>>>([]);
  // --------------end of Bank dropdown


  //---------------Country dropdown begining

  Rx<List<CountryValues>> listCountryModel_ = Rx<List<CountryValues>>([]);
  Rx<CountryValues>? _selectedCountryId;
  Rx<CountryValues>? get selectedCountryId => _selectedCountryId;

  setCountryId(CountryValues? value) {
    print("setCountryId ${value!.oid}");

    refresh();
    print("done setCountryId");
  }

  Rx<List<DropdownMenuItem<String>>> listCountryDropDownMenuItem =
      Rx<List<DropdownMenuItem<String>>>([]);
  // --------------end of Bank dropdown

  //---------------Bank dropdown begining

  Rx<List<IdentityTypeValues>> listIdentityTypeModel_ = Rx<List<IdentityTypeValues>>([]);
  Rx<IdentityTypeValues>? _selectedIdentityTypeId;
  Rx<IdentityTypeValues>? get selectedIdentityTypeId => _selectedIdentityTypeId;

  setIdentityTypeId(IdentityTypeValues? value) {
    print("setIdentityTypeId ${value!.oid}");

    refresh();
    print("done setIdentityTypeId");
  }

  Rx<List<DropdownMenuItem<String>>> listIdentityTypeDropDownMenuItem =
      Rx<List<DropdownMenuItem<String>>>([]);
  // --------------end of IdentityType dropdown

  //---------------LocalGovernment dropdown begining

  Rx<List<LocalGovernmentValues>> listLocalGovernmentModel_ = Rx<List<LocalGovernmentValues>>([]);
  Rx<LocalGovernmentValues>? _selectedLocalGovernmentId;
  Rx<LocalGovernmentValues>? get selectedLocalGovernmentId => _selectedLocalGovernmentId;

  setLocalGovernmentId(LocalGovernmentValues? value) {
    print("setLocalGovernmentId ${value!.oid}");

    refresh();
    print("done setLocalGovernmentId");
  }

  Rx<List<DropdownMenuItem<String>>> listLocalGovernmentDropDownMenuItem =
      Rx<List<DropdownMenuItem<String>>>([]);
  // --------------end of LocalGovernment dropdown


  //---------------RelationshipType dropdown begining

  Rx<List<RelationshipTypeValues>> listRelationshipTypeModel_ = Rx<List<RelationshipTypeValues>>([]);
  Rx<RelationshipTypeValues>? _selectedRelationshipTypeId;
  Rx<RelationshipTypeValues>? get selectedRelationshipTypeId => _selectedRelationshipTypeId;

  setRelationshipTypeId(RelationshipTypeValues? value) {
    print("setRelationshipTypeId ${value!.oid}");

    refresh();
    print("done setRelationshipTypeId");
  }

  Rx<List<DropdownMenuItem<String>>> listRelationshipTypeDropDownMenuItem =
      Rx<List<DropdownMenuItem<String>>>([]);
  // --------------end of RelationshipType dropdown

  //---------------StateOfOrigin dropdown begining

  Rx<List<StateOfOriginValues>> listStateOfOriginModel_ = Rx<List<StateOfOriginValues>>([]);
  Rx<StateOfOriginValues>? _selectedStateOfOriginId;
  Rx<StateOfOriginValues>? get selectedStateOfOriginId => _selectedStateOfOriginId;

  setStateOfOriginId(StateOfOriginValues? value) {
    print("setStateOfOriginId ${value!.oid}");

    refresh();
    print("done setStateOfOriginId");
  }

  Rx<List<DropdownMenuItem<String>>> listStateOfOriginDropDownMenuItem =
      Rx<List<DropdownMenuItem<String>>>([]);
  // --------------end of StateOfOrigin dropdown


  void getTitles(String url) {
    print("get Titles");
    try {
      Get.dialog(Center(
        child: SpinKitDualRing(
          color: Colors.green,
          lineWidth: 2,
        ),
      ));

      repository.getLoadedData(url).then((value) {
        if (value.values!.length > 0) {
          print("get Titles data: ${value.toString()}");
          Get.back();
          listTitleModel_.value.clear();
          listTitleModel_.value.addAll(value.values!);
          refresh();
          listTitleDropDownMenuItem.value = [];
          listTitleDropDownMenuItem.value.add(
            DropdownMenuItem(
              child: Text(
                'Select Title',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              value: "0",
            ),
          );
          for (Values Title in listTitleModel_.value) {
            print(Title.toJson());

            listTitleDropDownMenuItem.value.add(
              DropdownMenuItem(
                child: Text(
                  Title.name.toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                value: Title.oid.toString(),
              ),
            );
          }
        }
      }).onError((error, stackTrace) {
        print(error.toString());
        Get.back();
        //error handling code
      });
    } catch (exception) {
      print(exception.toString());
      Get.back();
      // exception handling code
    }
  }

  String? validateTitle(String value) {
    if (value == "0") {
      return "Select Title";
    }
    return null;
  }

  void getClusters(String url) {
    print("get Clusters");
    try {
      Get.dialog(Center(
        child: SpinKitDualRing(
          color: Colors.green,
          lineWidth: 2,
        ),
      ));

      repository.getLoadedClusterData(url).then((value) {
        if (value.clusterValues!.length > 0) {
          print("get Clusters data: ${value.toString()}");
          Get.back();
          listClusterModel_.value.clear();
          listClusterModel_.value.addAll(value.clusterValues!);
          refresh();
          listClusterDropDownMenuItem.value = [];
          listClusterDropDownMenuItem.value.add(
            DropdownMenuItem(
              child: Text(
                'Select Cluster',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              value: "0",
            ),
          );
          for (ClusterValues cluster in listClusterModel_.value) {
            print(cluster.toJson());

            listClusterDropDownMenuItem.value.add(
              DropdownMenuItem(
                child: Text(
                  cluster.name.toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                value: cluster.oid.toString(),
              ),
            );
          }
        }
      }).onError((error, stackTrace) {
        print(error.toString());
        Get.back();
        //error handling code
      });
    } catch (exception) {
      print(exception.toString());
      Get.back();
      // exception handling code
    }
  }

  String? validateCluster(String value) {
    if (value == "0") {
      return "Select Cluster";
    }
    return null;
  }

  
  void getCooperativesByClusterId(String url, var clusterOid) {
    print("get Clusters");
    try {
      Get.dialog(Center(
        child: SpinKitDualRing(
          color: Colors.green,
          lineWidth: 2,
        ),
      ));

      repository.getLoadedCooperativeDataByClusterOid(url, clusterOid).then((value) {
        if (value.cooperativeValues!.length > 0) {
          print("get Clusters data: ${value.toString()}");
          Get.back();
          listCooperativeModel_.value.clear();
          listCooperativeModel_.value.addAll(value.cooperativeValues!);
          refresh();
          listCooperativeDropDownMenuItem.value = [];
          listCooperativeDropDownMenuItem.value.add(
            DropdownMenuItem(
              child: Text(
                'Select Cooperative',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              value: "0",
            ),
          );
          for (CooperativeValues cluster in listCooperativeModel_.value) {
            print(cluster.toJson());

            listCooperativeDropDownMenuItem.value.add(
              DropdownMenuItem(
                child: Text(
                  cluster.name.toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                value: cluster.oid.toString(),
              ),
            );
          }
        }
      }).onError((error, stackTrace) {
        print(error.toString());
        Get.back();
        //error handling code
      });
    } catch (exception) {
      print(exception.toString());
      Get.back();
      // exception handling code
    }
  }

  String? validateCooperativesByClusterOid(String value) {
    if (value == "0") {
      return "Select Cooperative";
    }
    return null;
  }


  void getMaritalStatus(String url) {
    print("get MaritalStatus");
    try {
      Get.dialog(Center(
        child: SpinKitDualRing(
          color: Colors.green,
          lineWidth: 2,
        ),
      ));

      repository.getLoadedMaritalStatusData(url).then((value) {
        if (value.maritalStatusValues!.length > 0) {
          print("get MaritalStatus data: ${value.toString()}");
          Get.back();
          listMaritalStatusModel_.value.clear();
          listMaritalStatusModel_.value.addAll(value.maritalStatusValues!);
          refresh();
          listMaritalStatusDropDownMenuItem.value = [];
          listMaritalStatusDropDownMenuItem.value.add(
            DropdownMenuItem(
              child: Text(
                'Select MaritalStatus',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              value: "0",
            ),
          );
          for (MaritalStatusValues maritalStatus
              in listMaritalStatusModel_.value) {
            print(maritalStatus.toJson());

            listMaritalStatusDropDownMenuItem.value.add(
              DropdownMenuItem(
                child: Text(
                  maritalStatus.description.toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                value: maritalStatus.id.toString(),
              ),
            );
          }
        }
      }).onError((error, stackTrace) {
        print(error.toString());
        Get.back();
        //error handling code
      });
    } catch (exception) {
      print(exception.toString());
      Get.back();
      // exception handling code
    }
  }

  String? validateMaritalStatus(String value) {
    if (value == "0") {
      return "Select MaritalStatus";
    }
    return null;
  }

  void getAccountType(String url) {
    print("get AccountType");
    try {
      Get.dialog(Center(
        child: SpinKitDualRing(
          color: Colors.green,
          lineWidth: 2,
        ),
      ));

      repository.getLoadedAccountTypeData(url).then((value) {
        if (value.accountTypeValues!.length > 0) {
          print("get AccountType data: ${value.toString()}");
          Get.back();
          listAccountTypeModel_.value.clear();
          listAccountTypeModel_.value.addAll(value.accountTypeValues!);
          refresh();
          listAccountTypeDropDownMenuItem.value = [];
          listAccountTypeDropDownMenuItem.value.add(
            DropdownMenuItem(
              child: Text(
                'Select AccountType',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              value: "0",
            ),
          );
          for (AccountTypeValues accountType in listAccountTypeModel_.value) {
            print(accountType.toJson());

            listAccountTypeDropDownMenuItem.value.add(
              DropdownMenuItem(
                child: Text(
                  accountType.name.toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                value: accountType.oid.toString(),
              ),
            );
          }
        }
      }).onError((error, stackTrace) {
        print(error.toString());
        Get.back();
        //error handling code
      });
    } catch (exception) {
      print(exception.toString());
      Get.back();
      // exception handling code
    }
  }

  String? validateAccountType(String value) {
    if (value == "0") {
      return "Select AccountType";
    }
    return null;
  }

  void getBank(String url) {
    print("get Bank");
    try {
      Get.dialog(Center(
        child: SpinKitDualRing(
          color: Colors.green,
          lineWidth: 2,
        ),
      ));

      repository.getLoadedBankData(url).then((value) {
        if (value.bankValues!.length > 0) {
          print("get Bank data: ${value.toString()}");
          Get.back();
          listBankModel_.value.clear();
          listBankModel_.value.addAll(value.bankValues!);
          refresh();
          listBankDropDownMenuItem.value = [];
          listBankDropDownMenuItem.value.add(
            DropdownMenuItem(
              child: Text(
                'Select Bank',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              value: "0",
            ),
          );
          for (BankValues bank in listBankModel_.value) {
            print(bank.toJson());

            listBankDropDownMenuItem.value.add(
              DropdownMenuItem(
                child: Text(
                  bank.name.toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                value: bank.oid.toString(),
              ),
            );
          }
        }
      }).onError((error, stackTrace) {
        print(error.toString());
        Get.back();
        //error handling code
      });
    } catch (exception) {
      print(exception.toString());
      Get.back();
      // exception handling code
    }
  }

  String? validateBank(String value) {
    if (value == "0") {
      return "Select Bank";
    }
    return null;
  }

  void getCountry(String url) {
    print("get Country");
    try {
      Get.dialog(Center(
        child: SpinKitDualRing(
          color: Colors.green,
          lineWidth: 2,
        ),
      ));

      repository.getLoadedCountryData(url).then((value) {
        if (value.countryValues!.length > 0) {
          print("get Bank data: ${value.toString()}");
          Get.back();
          listCountryModel_.value.clear();
          listCountryModel_.value.addAll(value.countryValues!);
          refresh();
          listCountryDropDownMenuItem.value = [];
          listCountryDropDownMenuItem.value.add(
            DropdownMenuItem(
              child: Text(
                'Select Country',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              value: "0",
            ),
          );
          for (CountryValues country in listCountryModel_.value) {
            print(country.toJson());

            listCountryDropDownMenuItem.value.add(
              DropdownMenuItem(
                child: Text(
                  country.name.toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                value: country.oid.toString(),
              ),
            );
          }
        }
      }).onError((error, stackTrace) {
        print(error.toString());
        Get.back();
        //error handling code
      });
    } catch (exception) {
      print(exception.toString());
      Get.back();
      // exception handling code
    }
  }

  String? validateCountry(String value) {
    if (value == "0") {
      return "Select Country";
    }
    return null;
  }

  void getIdentityType(String url) {
    print("get IdentityType");
    try {
      Get.dialog(Center(
        child: SpinKitDualRing(
          color: Colors.green,
          lineWidth: 2,
        ),
      ));

      repository.getLoadedIdentityTypeData(url).then((value) {
        if (value.identityTypeValues!.length > 0) {
          print("get IdentityType data: ${value.toString()}");
          Get.back();
          listIdentityTypeModel_.value.clear();
          listIdentityTypeModel_.value.addAll(value.identityTypeValues!);
          refresh();
          listIdentityTypeDropDownMenuItem.value = [];
          listIdentityTypeDropDownMenuItem.value.add(
            DropdownMenuItem(
              child: Text(
                'Select IdentityType',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              value: "0",
            ),
          );
          for (IdentityTypeValues identityType in listIdentityTypeModel_.value) {
            print(identityType.toJson());

            listIdentityTypeDropDownMenuItem.value.add(
              DropdownMenuItem(
                child: Text(
                  identityType.name.toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                value: identityType.oid.toString(),
              ),
            );
          }
        }
      }).onError((error, stackTrace) {
        print(error.toString());
        Get.back();
        //error handling code
      });
    } catch (exception) {
      print(exception.toString());
      Get.back();
      // exception handling code
    }
  }

  String? validateIdentityType(String value) {
    if (value == "0") {
      return "Select IdentityType";
    }
    return null;
  }


 void getLocalGovernmentByStateId(String url, int stateOid) {
    print("get LocalGovernment By State Id");
    try {
      Get.dialog(Center(
        child: SpinKitDualRing(
          color: Colors.green,
          lineWidth: 2,
        ),
      ));

      repository.getLoadedLocalGovernmentByStateIdData(url, stateOid).then((value) {
        if (value.localGovernmentValues!.length > 0) {
          print("get LocalGovernment data: ${value.toString()}");
          Get.back();
          listLocalGovernmentModel_.value.clear();
          listLocalGovernmentModel_.value.addAll(value.localGovernmentValues!);
          refresh();
          listLocalGovernmentDropDownMenuItem.value = [];
          listLocalGovernmentDropDownMenuItem.value.add(
            DropdownMenuItem(
              child: Text(
                'Select LocalGovernment',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              value: "0",
            ),
          );
          for (LocalGovernmentValues localGovernment in listLocalGovernmentModel_.value) {
            print(localGovernment.toJson());

            listLocalGovernmentDropDownMenuItem.value.add(
              DropdownMenuItem(
                child: Text(
                  localGovernment.name.toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                value: localGovernment.oid.toString(),
              ),
            );
          }
        }
      }).onError((error, stackTrace) {
        print(error.toString());
        Get.back();
        //error handling code
      });
    } catch (exception) {
      print(exception.toString());
      Get.back();
      // exception handling code
    }
  }

  String? validateLocalGovernmentByStateId(String value) {
    if (value == "0") {
      return "Select LocalGovernment";
    }
    return null;
  }

void getRelationshipType(String url) {
    print("get RelationshipType");
    try {
      Get.dialog(Center(
        child: SpinKitDualRing(
          color: Colors.green,
          lineWidth: 2,
        ),
      ));

      repository.getLoadedRelationshipTypeData(url).then((value) {
        if (value.relationshipTypeValues!.length > 0) {
          print("get RelationshipType data: ${value.toString()}");
          Get.back();
          listRelationshipTypeModel_.value.clear();
          listRelationshipTypeModel_.value.addAll(value.relationshipTypeValues!);
          refresh();
          listRelationshipTypeDropDownMenuItem.value = [];
          listRelationshipTypeDropDownMenuItem.value.add(
            DropdownMenuItem(
              child: Text(
                'Select RelationshipType',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              value: "0",
            ),
          );
          for (RelationshipTypeValues relationshipType in listRelationshipTypeModel_.value) {
            print(relationshipType.toJson());

            listRelationshipTypeDropDownMenuItem.value.add(
              DropdownMenuItem(
                child: Text(
                  relationshipType.name.toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                value: relationshipType.oid.toString(),
              ),
            );
          }
        }
      }).onError((error, stackTrace) {
        print(error.toString());
        Get.back();
        //error handling code
      });
    } catch (exception) {
      print(exception.toString());
      Get.back();
      // exception handling code
    }
  }

String? validateRelationshipType(String value) {
    if (value == "0") {
      return "Select RelationshipType";
    }
    return null;
  }

 void getStateOfOrigin(String url) {
    print("get StateOfOrigin");
    try {
      Get.dialog(Center(
        child: SpinKitDualRing(
          color: Colors.green,
          lineWidth: 2,
        ),
      ));

      repository.getLoadedStateOfOriginData(url).then((value) {
        if (value.stateOfOriginValues!.length > 0) {
          print("get StateOfOrigin data: ${value.toString()}");
          Get.back();
          listStateOfOriginModel_.value.clear();
          listStateOfOriginModel_.value.addAll(value.stateOfOriginValues!);
          refresh();
          listStateOfOriginDropDownMenuItem.value = [];
          listStateOfOriginDropDownMenuItem.value.add(
            DropdownMenuItem(
              child: Text(
                'Select StateOfOriginValues',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              value: "0",
            ),
          );
          for (StateOfOriginValues stateOfOriginValues in listStateOfOriginModel_.value) {
            print(stateOfOriginValues.toJson());

            listRelationshipTypeDropDownMenuItem.value.add(
              DropdownMenuItem(
                child: Text(
                  stateOfOriginValues.name.toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                value: stateOfOriginValues.oid.toString(),
              ),
            );
          }
        }
      }).onError((error, stackTrace) {
        print(error.toString());
        Get.back();
        //error handling code
      });
    } catch (exception) {
      print(exception.toString());
      Get.back();
      // exception handling code
    }
  }

  String? validateStateOfOrigin(String value) {
    if (value == "0") {
      return "Select StateOfOrigin";
    }
    return null;
  }

  var isLoading = false.obs;
  final Dio _dio = Dio();

  final ApiServiceProvider _provider = ApiServiceProvider();

  createProfile (BuildContext context, dynamic data) async {
    try {
      isLoading(true);
       Response response = await _dio.post(BaseEndpoint.baseUrl + Endpoints.createFarmerProfile, data: data);
        print ('submitted farmer record ${response.data}');
        Future.delayed(Duration(seconds: 1), () {
          AppSnacks.show(context, backgroundColor: Colors.green, leadingIcon: Icon(Icons.check), message: 'Profile Updated Success!');
        });
      isLoading(false);
      Get.toNamed('/home');

    }catch(e){
        print('Operation Failed $e');
         AppSnacks.show(context, leadingIcon: Icon(Icons.check), message: 'Operation Failed!');

         isLoading(false);

 
    }
  }

}
