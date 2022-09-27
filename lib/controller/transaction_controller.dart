// ignore_for_file: prefer_const_constructors

import 'package:dcms_app/models/agent_farmer.dart';
import 'package:dcms_app/models/new_farm_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/farm.dart';
import '../models/farmer.dart';
import '../models/transaction.dart';
import '../respository/transaction_repository.dart';
import '../routes/auth_endpoints.dart';
import '../routes/base.dart';
import '../utils/app_snacks.dart';

class TransactionController extends GetxController with StateMixin<List<dynamic>> {
   

    
  var isDataProcessing = false.obs;
  Dio dio = Dio();
  Repository repository;

  TransactionController(this.repository);

  late TextEditingController amountDueController;
  late TextEditingController purchaseDateController;
  late TextEditingController tonnageController;
  late DateTime selectedDate;


  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //---------------farmer dropdown begining

  Rx<List<Values>> listFarmerModel_ = Rx<List<Values>>([]);

  Rx<Values>? _selectedFarmerId;

  Rx<Values>? get selectedFarmerId => _selectedFarmerId;

  set selectedFarmerId(Rx<Values>? value) {
    _selectedFarmerId = value;
    
    refresh();
  }

  Rx<List<DropdownMenuItem<String>>> listFarmerDropDownMenuItem =
      Rx<List<DropdownMenuItem<String>>>([]);
// --------------end of farmer dropdown



 //--------------- farm dependent dropdown begining

  Rx<List<FarmValues>> listFarmModel_ = Rx<List<FarmValues>>([]);

  Rx<FarmValues>? _selectedFarmId;

  Rx<FarmValues>? get selectedFarmId => _selectedFarmId;

  set selectedFarmId(Rx<FarmValues>? value) {
    _selectedFarmId = value;
    
    refresh();
  }

  Rx<List<DropdownMenuItem<String>>> listFarmDropDownMenuItem =
      Rx<List<DropdownMenuItem<String>>>([]);
// --------------farm dependent farm dropdown












// -------------- old farmer farm dropdown

  // Rx<List<Farm>> listFarmModel = Rx<List<Farm>>([]);
  // var selectedFarmId = "0".obs;
  // Rx<List<DropdownMenuItem<String>>> listFarmDropDownMenuItem =
  //     Rx<List<DropdownMenuItem<String>>>([]);
// -----------------end of old farmer farm dropdown
 
  GlobalKey<FormState> transactionFormKey = GlobalKey<FormState>();
    
    void onInit() {
      super.onInit(); 
      amountDueController  = TextEditingController();
      purchaseDateController  = TextEditingController();
      tonnageController  = TextEditingController();
    }

  @override
  void onReady() {
    super.onReady();
       var agentOid = 1; // you are to get this from the shared preference file
    getFarmers(agentOid.toString());
  }

  @override
  void onClose() {
    super.onClose();
    amountDueController.dispose();
    purchaseDateController.dispose();
    tonnageController.dispose();
  }

  void getFarmers(String agentOid) {
    print("get farmers");
    try {
      Get.dialog(Center(
        child: SpinKitDualRing(
                color: Colors.green,
                lineWidth: 2,
              ),
        ));

      repository.getFarmer(agentOid).then((value) {
        if (value.values!.length > 0) {
          print("xxxxx ${value.values.toString()}"); 
          Get.back();
          listFarmerModel_.value.clear();
          listFarmerModel_.value.addAll(value.values!);
          listFarmerDropDownMenuItem.value = [];
          listFarmerDropDownMenuItem.value.add(
            DropdownMenuItem(
              child: Text(
                'Select Farmer',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              value: "0",
            ),
          );
          for (Values farmer in listFarmerModel_.value) {
            print(farmer.toJson());

        
            listFarmerDropDownMenuItem.value.add(
              DropdownMenuItem(
                child: Text(
                  farmer.firstName.toString() +
                      ' ' +
                      farmer.lastName.toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                value: farmer.userId.toString(),
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




  void getFarmersFarm(String farmerOid) {
    print("get farmers farm");
    try {
      Get.dialog(Center(
        child: SpinKitDualRing(
                color: Colors.green,
                lineWidth: 2,
              ),
        ));

      repository.getFarmData(farmerOid).then((value) {
        if (value.values!.length > 0) {
          print("yyyyy ${value.values.toString()}"); 
          Get.back();
          listFarmModel_.value.clear();
          listFarmModel_.value.addAll(value.values!);
          listFarmDropDownMenuItem.value = [];
          listFarmDropDownMenuItem.value.add(
            DropdownMenuItem(
              child: Text(
                'Select Farm',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              value: "0",
            ),
          );
          for (FarmValues farm in listFarmModel_.value) {
            print(farm.toJson());

        
            listFarmerDropDownMenuItem.value.add(
              DropdownMenuItem(
                child: Text(
                  farm.title.toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                value: farm.oid.toString(),
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



  // void getFarms(String farmerId) {
  //   try {
  //     Get.dialog(Center(
  //       child: CircularProgressIndicator(),
  //     ));

  //     repository.getFarm(farmerId).then((value) {
  //       if (value.farmData!.length > 0) {
  //         Get.back();
  //         listFarmModel.value.clear();
  //         listFarmModel.value.addAll(value.farmData!);
  //         listFarmDropDownMenuItem.value = [];
  //         listFarmDropDownMenuItem.value.add(
  //           DropdownMenuItem(
  //             child: Text(
  //               'Select Farm',
  //               style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  //             ),
  //             value: "0",
  //           ),
  //         );
  //         for (Farm states in listFarmModel.value) {
  //           listFarmerDropDownMenuItem.value.add(
  //             DropdownMenuItem(
  //               child: Text(
  //                 states.farmName.toString(),
  //                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  //               ),
  //               value: states.farmId.toString(),
  //             ),
  //           );
  //         }
  //       }
  //     }).onError((error, stackTrace) {
  //       Get.back();
  //       //error handling code
  //     });
  //   } catch (exception) {
  //     Get.back();
  //     // exception handling code
  //   }
  // }

  String? validateFarmer(String value) {
    if (value == "0") {
      return "Select Farmer";
    }
    return null;
  }

  String? validateFarm(String value) {
    if (value == "0") {
      return "Select Farm";
    }
    return null;
  }

  createTransaction(
      BuildContext context, Transaction transactionDataBody) async {
    try {
      isDataProcessing(true);
      update();
      String url = BaseEndpoint.baseUrl + Endpoints.createTransaction;
      print(url);
      print('transaction-data ${transactionDataBody}');
      Response response =
          await dio.post(url, data: transactionDataBody.toJson());
      print(response.data);
      if (response.statusCode == 201) {
        isDataProcessing(false);
        Navigator.pop(context);
        AppSnacks.show(context,
            backgroundColor: Colors.green,
            leadingIcon: Icon(Icons.check),
            message: 'Transaction Created Success!');
        // _getTransactions();
        update();
        return response.data;
      }
    } catch (e) {
      print('Operation Failed $e');
      isDataProcessing(false);
      update();
      return e.toString();
    }
  }
}
