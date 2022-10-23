// ignore_for_file: prefer_const_constructors

import 'package:dcms_app/models/agent_farmer.dart';
import 'package:dcms_app/models/new_farm_data.dart';
import 'package:dcms_app/models/transaction.dart';
import 'package:dcms_app/routes/base.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../respository/transaction_repository.dart';
import '../routes/auth_endpoints.dart';
import '../services/batch_service_provider.dart';
import '../utils/app_snacks.dart';
import '../view/screens/transactions.dart';

class TransactionController extends GetxController
    with StateMixin<List<dynamic>> {
  var isDataProcessing = false.obs;
  Dio dio = Dio();
  Repository repository;
  late SharedPreferences _prefs;


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

  setFarmerId(Values? value) {
    print("setFarmerId");

    //clear the previous farmerlist if any was selected
    _selectedFarm = null;
    listFarmModel_ = Rx<List<Farms>>([]);
    refresh();

    //get the new farmer object
    _selectedFarmerId = value!.obs;

    //extract the farm from the selected farmer object to the farmList
    _selectedFarmerId?.value.farms?.forEach((e) {
      listFarmModel_.value.add(e);
    });

    refresh();
    print("done setFarmerId");
  }

  Rx<List<DropdownMenuItem<String>>> listFarmerDropDownMenuItem =
      Rx<List<DropdownMenuItem<String>>>([]);
// --------------end of farmer dropdown

  //--------------- farm dependent dropdown begining

  Rx<List<Farms>> listFarmModel_ = Rx<List<Farms>>([]);

  Rx<List<FarmData>> farmersFarm = Rx<List<FarmData>>([]);

  Rx<Farms>? _selectedFarm;

  Rx<Farms>? get selectedFarm => _selectedFarm;

  setFarm(Farms? value) async {
    _selectedFarm = value!.obs;

    var currentSelectedFarmOid = value.oid;
    print('SELECTED FARM ${currentSelectedFarmOid}');
    _prefs = await SharedPreferences.getInstance();
    _prefs.setInt('farmoid', currentSelectedFarmOid!.toInt());
   
    refresh();
  }

  Rx<Farms>? _selectedFarmId;

  Rx<Farms>? get selectedFarmId => _selectedFarmId;

  set selectedFarmId(Rx<Farms>? value) {
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
    amountDueController = TextEditingController();
    purchaseDateController = TextEditingController();
    tonnageController = TextEditingController();


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
          print("get farmers data: ${value.values.toString()}");
          Get.back();
          listFarmerModel_.value.clear();
          listFarmerModel_.value.addAll(value.values!);
          refresh();
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
                  farmer.firstName.toString() +' ' +farmer.lastName.toString(),
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

  createTransaction( BuildContext context, TransactionController controller, data) async {
     try {
        var  storedFarmOid = (_prefs.getInt('farmoid') ?? '') as int;
        print('Stored Farm Oid $storedFarmOid');

        print('selected purchased date $selectedDate');
        var _batchOid =data.toString();
        var _farmOid = storedFarmOid;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        String username = (prefs.getString('username') ?? '');
        Transaction transactionDataBody = Transaction(
            amountDue: 0,
            batchOid: int.tryParse(_batchOid),
            farmerOid: controller.selectedFarmerId?.value.oid,
            farmOid: _farmOid,
            purchaseDate: selectedDate.toString().isNotEmpty? selectedDate.toString() : DateTime.now().toString(),
            tonnage: int.tryParse(controller.tonnageController.text.trim()),
            createdBy: username,
            createdOn: DateTime.now().toString());

  
      isDataProcessing(true);
      update();
      String url = BaseEndpoint.baseUrl + Endpoints.createTransaction;
      print(url);
      print('transaction-data $transactionDataBody');
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

 getBatchTransactions (var batchid) async {
      BatchProvider().getBatchesTransactions(batchid).then((value) {
        print('returned transactions: $value');
        change(value, status: RxStatus.success());
      },onError: (error){
        change(null,status: RxStatus.error(error.toString()));
      });
  }

}


