// ignore_for_file: prefer_const_constructors

import 'package:dcms_app/models/cluster.dart';
import 'package:dcms_app/respository/farmer_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/account_type.dart';
import '../models/cooperative.dart';
import '../models/marital_status.dart';
import '../models/title.dart';
import '../routes/auth_endpoints.dart';

class FarmerController extends GetxController with StateMixin<List<dynamic>> {
  var isDataProcessing = false.obs;
  Dio dio = Dio();
  FarmerRepository repository;
  late SharedPreferences _prefs;
  FarmerController(this.repository);

  late TextEditingController amountDueController;
  late TextEditingController purchaseDateController;
  late TextEditingController tonnageController;

  final firstStepFormKey = GlobalKey<FormState>();

  final secondStepFormKey = GlobalKey<FormState>();

  final thirdStepFormKey = GlobalKey<FormState>();

  final fourthStepFormKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  late DateTime dateOfBirth;
  TextEditingController applicantIdController = TextEditingController();
  final TextEditingController bvnController = TextEditingController();
  TextEditingController primaryPhone = TextEditingController();
  TextEditingController secondaryPhone = TextEditingController();
  // seasonoid
  // assignedAgent
  // clusteroid
  // cooperativeoid
  TextEditingController contactAddress = TextEditingController();
  // photo
  // cooperativemembershipstatus
  // martialstatus
  // onboardingtype

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
    print("setAccountTypeId");

    refresh();
    print("done setAccountTypeId");
  }

  Rx<List<DropdownMenuItem<String>>> listAccountTypeDropDownMenuItem =
      Rx<List<DropdownMenuItem<String>>>([]);
  // --------------end of AccountType dropdown

  GlobalKey<FormState> transactionFormKey = GlobalKey<FormState>();

  void onInit() {
    super.onInit();
    amountDueController = TextEditingController();
    purchaseDateController = TextEditingController();
    tonnageController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
    getTitles(Endpoints.getAllTitles);
    getClusters(Endpoints.getAllCluters);
    getCooperatives(Endpoints.getAllCooperatives);
    getMaritalStatus(Endpoints.getAllMaritalStatus);
    getAccountType(Endpoints.getAccountTypes);
  }

  @override
  void onClose() {
    super.onClose();
    amountDueController.dispose();
    purchaseDateController.dispose();
    tonnageController.dispose();
  }

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

  void getCooperatives(String url) {
    print("get Clusters");
    try {
      Get.dialog(Center(
        child: SpinKitDualRing(
          color: Colors.green,
          lineWidth: 2,
        ),
      ));

      repository.getLoadedCooperativeData(url).then((value) {
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

  String? validateCooperative(String value) {
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

// cooperativeOid

  // createTransaction( BuildContext context, FarmerController controller, data) async {
  //    try {
  //       var  storedFarmOid = (_prefs.getInt('farmoid') ?? '') as int;
  //       print('Stored Farm Oid $storedFarmOid');

  //       print('selected purchased date $selectedDate');
  //       var _batchOid =data.toString();
  //       var _farmOid = storedFarmOid;

  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       String username = (prefs.getString('username') ?? '');
  //       Transaction transactionDataBody = Transaction(
  //           amountDue: 0,
  //           batchOid: int.tryParse(_batchOid),
  //           farmerOid: controller.selectedFarmerId?.value.oid,
  //           farmOid: _farmOid,
  //           purchaseDate: selectedDate.toString().isNotEmpty? selectedDate.toString() : DateTime.now().toString(),
  //           tonnage: int.tryParse(controller.tonnageController.text.trim()),
  //           createdBy: username,
  //           createdOn: DateTime.now().toString());

  //     isDataProcessing(true);
  //     update();
  //     String url = BaseEndpoint.baseUrl + Endpoints.createTransaction;
  //     print(url);
  //     print('transaction-data $transactionDataBody');
  //     Response response =
  //         await dio.post(url, data: transactionDataBody.toJson());
  //     print(response.data);
  //     if (response.statusCode == 201) {
  //       isDataProcessing(false);
  //       Navigator.pop(context);
  //       AppSnacks.show(context,
  //           backgroundColor: Colors.green,
  //           leadingIcon: Icon(Icons.check),
  //           message: 'Transaction Created Success!');
  //       // _getTransactions();

  //       update();
  //       return response.data;
  //     }
  //   } catch (e) {
  //     print('Operation Failed $e');
  //     isDataProcessing(false);
  //     update();
  //     return e.toString();
  //   }
  // }

}
