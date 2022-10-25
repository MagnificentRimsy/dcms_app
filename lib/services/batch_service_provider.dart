



import 'package:dcms_app/routes/endpoints.dart';
import 'package:dcms_app/routes/base.dart';
import 'package:get/get.dart';

class BatchProvider extends GetConnect {
  BatchProvider() {

    timeout = const Duration(seconds: 30);
    maxAuthRetries = 3;
  }

  // Fetch Data
  Future<List<dynamic>> getBatches(var username) async {
    try {
      final response = await get(
          BaseEndpoint.baseUrl+Endpoints.getBatchByUserName+username).timeout(const Duration(seconds: 30));
      if (response.status.hasError) {
        return Future.error(response.statusText.toString());
      } else {
        return response.body['values'];
      }
    }
    catch(exception)
    {

      return Future.error(exception.toString());
    }
  }

   Future<List<dynamic>> getBatchesTransactions(var batchoid) async {
    try {
      final response = await get(
          BaseEndpoint.baseUrl+Endpoints.getTransactionsByBatchoid+batchoid).timeout(const Duration(seconds: 30));
      if (response.status.hasError) {
        return Future.error(response.statusText.toString());
      } else {
        return response.body['values'];
      }
    }
    catch(exception)
    {

      return Future.error(exception.toString());
    }
  }

}
