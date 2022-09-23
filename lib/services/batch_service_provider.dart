



import 'package:dcms_app/routes/auth_endpoints.dart';
import 'package:dcms_app/routes/base.dart';
import 'package:get/get.dart';

class BatchProvider extends GetConnect {
  // Fetch Data
  Future<List<dynamic>> getBatches(var username) async {
    try {
      final response = await get(
          BaseEndpoint.baseUrl+Endpoints.getBatchByUserName+username);
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
