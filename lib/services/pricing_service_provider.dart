



import 'dart:convert';

import 'package:get/get.dart';
import 'package:dcms_app/models/pricing.dart';
import 'package:dcms_app/routes/endpoints.dart';
import 'package:dcms_app/routes/base.dart';

class PricingProvider extends GetConnect {
  // Fetch Data
  Future<List<dynamic>> getPricing() async {
    try {
      final response = await get(BaseEndpoint.baseUrl+Endpoints.getCurrentPricing);
      if (response.status.hasError) {
        return Future.error(response.statusText.toString());
      } else {
        var data =  jsonDecode(response.body['values']['pricingItems']);
        return data;


      }
    }
    catch(exception)
    {
      return Future.error(exception.toString());
    }
  }


  Future<List<PricingItem>> getCurrentMarketPricing() async {
   
    try {
      Response response = await get(BaseEndpoint.baseUrl+Endpoints.getCurrentPricing);
      if (response.status.hasError) {
        return Future.error(response.statusText.toString());
      } else {
        
          List<dynamic> body = jsonDecode(response.body);

            List<PricingItem> pricingItems = body
            .map(
              (dynamic item) => PricingItem.fromJson(item),           
            )
            .toList();
          return pricingItems;

      }
    }
    catch(exception)
    {
      return Future.error(exception.toString());
    }
  }








  
  Future<List<dynamic>> getRecentMarketPrice() async {
   
    try {
      dynamic response = await get(BaseEndpoint.baseUrl+Endpoints.getCurrentPricing).timeout(const Duration(seconds: 30));
      if (response.status.hasError) {
        return Future.error(response.statusText.toString());
      } else {
        
       Map<String, dynamic> body = json.decode(response.bodyString);
          print('pricin-api-response ${body}');

        List<dynamic> data = body["values"][0]["pricingItems"];
        print('yyyyyyyy ${data}');

            // List<dynamic> newprices = body
            // .map(
            //   (dynamic item) => PricingItem.fromJson(item),           
            // )
            // .toList();
          return data;

      }
    }
    catch(exception)
    {
      return Future.error(exception.toString());
    }
  }




}
