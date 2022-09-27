



import 'package:dcms_app/routes/auth_endpoints.dart';
import 'package:dcms_app/routes/base.dart';
import 'package:get/get.dart';

class PricingProvider extends GetConnect {
  // Fetch Data
  Future<List<dynamic>> getPricing() async {
    try {
      final response = await get(
          BaseEndpoint.baseUrl+Endpoints.getCurrentPricing);
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
