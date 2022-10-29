import 'package:dcms_app/respository/transaction_repository.dart';
import 'package:dcms_app/respository/farmer_repository.dart';

import 'package:get/get.dart';

import '../controller/agent_controller.dart';
import '../controller/batch_controller.dart';
import '../controller/farmer_controller.dart';
import '../controller/login_controller.dart';
import '../controller/otp_controller.dart';
import '../controller/pricing_controller.dart';
import '../controller/transaction_controller.dart';
import '../core/api_service_provider.dart';

class DataBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BatchController());
    Get.lazyPut(() => TransactionController(Repository(ApiServiceProvider())));
    Get.lazyPut(() => PricingController());
    Get.lazyPut(() => OtpController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => FarmerController(FarmerRepository(ApiServiceProvider())));
    Get.lazyPut(() => AgentController(FarmerRepository(ApiServiceProvider())));
  }

}