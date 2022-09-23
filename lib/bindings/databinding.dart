import 'package:dcms_app/respository/transaction_repository.dart';
import 'package:get/get.dart';

import '../controller/batch_controller.dart';
import '../controller/transaction_controller.dart';
import '../core/api_service_provider.dart';

class DataBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BatchController());
    Get.lazyPut(() => TransactionController(Repository(ApiServiceProvider())));
  }

}