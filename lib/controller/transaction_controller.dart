// // ignore_for_file: unused_field, unused_import

// import 'dart:convert';
// import 'package:dcms_app/data/models/data/batch.dart';
// import 'package:dcms_app/data/models/data/sign_in.dart';
// import 'package:dcms_app/data/models/data/two_factor.dart';
// import 'package:dcms_app/view/screens/dashboard.dart';
// import 'package:dcms_app/view/screens/home.dart';
// import 'package:dcms_app/view/screens/two_factor.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/route_manager.dart';
// import 'package:get/state_manager.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../core/api_service_provider.dart';
// import '../models/auth/user.dart';
// import '../models/transaction.dart';
// import '../routes/auth_endpoints.dart';
// import '../routes/base.dart';
// import '../services/batch_service_provider.dart';
// import '../utils/app_snacks.dart';

// class TransactionController extends GetxController with StateMixin<List<dynamic>> {
//   RxBool isLoading = false.obs;
//   final ApiServiceProvider _provider = ApiServiceProvider();
//   late SharedPreferences _prefs;

//   RxString batchDescriptionText = ''.obs;
//   Dio dio = Dio(); 
//   late TextEditingController batchDescriptionController;


//   // Get Batches
//     var listBatch = List<dynamic>.empty(growable: true).obs;
//     var page = 1;
//     var isDataProcessing = false.obs;
//     // For Pagination
//     ScrollController scrollController = ScrollController();
//     var isMoreDataAvailable = true.obs;


//  RxString username = ''.obs;

//   @override
//   void onInit() async{
//     super.onInit();
//     batchDescriptionController = TextEditingController();
//     _getTransactions ();
//   }




// _getTransactions () async {
//     _prefs = await  SharedPreferences.getInstance();
//      BatchProvider().getBatches(_prefs.getString('username') ).then((value) {
//       change(value, status: RxStatus.success());
//     },onError: (error){
//       change(null,status: RxStatus.error(error.toString()));
//     });
// }



//   @override
//   void onClose() {
//     super.onClose();
//     batchDescriptionController.dispose();
//   }


//   //Load Batches


//   // common snack bar
//   showSnackBar(String title, String message, Color backgroundColor) {
//     Get.snackbar(title, message,
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: backgroundColor,
//         colorText: Colors.white);
//   }



 
//   // Refresh List
//   void refreshList() async {
//     page = 1;
   
//   }

//   createTransaction(BuildContext context, Transaction transactionDataBody) async {

//     try {

//       isLoading(true);
//       update();
//       String url = BaseEndpoint.baseUrl+Endpoints.createBatch;
//       print(url);
//       print('batch-data ${transactionDataBody}');
//       Response response = await dio.post(url, data: transactionDataBody.toJson());
//       print (response.data);
//       if ( response.statusCode == 201 ) {

//         isLoading(false);
//         Navigator.pop(context);
//         AppSnacks.show(context, backgroundColor: Colors.green, leadingIcon: Icon(Icons.check), message: 'Transaction Created Success!');
//         _getTransactions();
//         update();
//         return response.data;
//       }
      
//     } catch (e) {
//       print('Operation Failed $e');
//       isLoading(false);
//       update();
//       return e.toString();
//     }
//   }
//
//
//}







// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

import '../respository/transaction_repository.dart';
import '../models/farm.dart';
import '../models/farmer.dart';
import '../models/transaction.dart';
import '../routes/auth_endpoints.dart';
import '../routes/base.dart';
import '../utils/app_snacks.dart';

class TransactionController extends GetxController {
  var isDataProcessing = false.obs;
  Dio dio = Dio(); 
  Repository repository;

  TransactionController(this.repository);

  late TextEditingController amountDueController;
  late TextEditingController purchaseDateController;
  late TextEditingController tonnageController;

//collect the batchoid, farmeroid, farmoid 

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<List<Farmer>> listFarmerModel = Rx<List<Farmer>>([]);
  var selectedFarmerId = "0".obs;
  Rx<List<DropdownMenuItem<String>>> listFarmerDropDownMenuItem = Rx<List<DropdownMenuItem<String>>>([]);

  Rx<List<Farm>> listFarmModel = Rx<List<Farm>>([]);
  var selectedFarmId = "0".obs;
  Rx<List<DropdownMenuItem<String>>> listFarmDropDownMenuItem = Rx<List<DropdownMenuItem<String>>>([]);

  
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    var agentOid = 1; // you are to get this from the shared preference file
    getFarmers(agentOid.toString());
  }

  @override
  void onClose() {}

  void getFarmers(String agentOid) {
    try {
      Get.dialog(Center(
        child: CircularProgressIndicator(),
      ));

      repository.getFarmer(agentOid).then((value) {
        if (value.farmerData!.length > 0) {
          Get.back();
          listFarmerModel.value.clear();
          listFarmerModel.value.addAll(value.farmerData!);
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
          for (Farmer farmer in listFarmerModel.value) {
            listFarmerDropDownMenuItem.value.add(
              DropdownMenuItem(
                child: Text(
                  farmer.farmerFirstName.toString() + ' '+farmer.farmerLastName.toString() ,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                value: farmer.farmerId.toString(),
              ),
            );
          }
        }
      }).onError((error, stackTrace) {
        Get.back();
        //error handling code
      });
    } catch (exception) {
      Get.back();
      // exception handling code
    }
  }

  void getFarms(String farmerId) {
    try {
      Get.dialog(Center(
        child: CircularProgressIndicator(),
      ));

      repository.getFarm(farmerId).then((value) {
        if (value.farmData!.length > 0) {
          Get.back();
          listFarmModel.value.clear();
          listFarmModel.value.addAll(value.farmData!);
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
          for (Farm states in listFarmModel.value) {
            listFarmerDropDownMenuItem.value.add(
              DropdownMenuItem(
                child: Text(
                  states.farmName.toString(),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                value: states.farmId.toString(),
              ),
            );
          }
        }
      }).onError((error, stackTrace) {
        Get.back();
        //error handling code
      });
    } catch (exception) {
      Get.back();
      // exception handling code
    }
  }

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

  
  createTransaction(BuildContext context, Transaction transactionDataBody) async {

    try {

      isDataProcessing(true);
      update();
      String url = BaseEndpoint.baseUrl+Endpoints.createBatch;
      print(url);
      print('batch-data ${transactionDataBody}');
      Response response = await dio.post(url, data: transactionDataBody.toJson());
      print (response.data);
      if ( response.statusCode == 201 ) {

        isDataProcessing(false);
        Navigator.pop(context);
        AppSnacks.show(context, backgroundColor: Colors.green, leadingIcon: Icon(Icons.check), message: 'Transaction Created Success!');
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