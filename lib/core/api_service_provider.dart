import 'package:dcms_app/models/farmer_transaction.dart';
import 'package:dcms_app/routes/auth_endpoints.dart';
import 'package:dcms_app/routes/base.dart';
import 'package:get/get.dart';

import '../models/farm.dart';

class ApiServiceProvider extends GetConnect {
  Future<Response> sendPost(String url, Map data) {
    Map<String, String> headers = {
      "Accept": "application/json",
    };

    return post(
      BaseEndpoint.baseUrl + url,
      data,
      headers: headers,
      contentType: 'application/json; charset=UTF-8',
    );
  }

  //Get farmers by agent Oid
  Future<FarmerTransaction> getFarmersByAgentOid(String agentOid) async {
    try {
      final response = await get(
          BaseEndpoint.baseUrl + Endpoints.getFarmersByAgentOid + agentOid);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        // print('Dropdown Response ${response.body}');

        return FarmerTransaction.fromJson(
            response.body); //farmerModelFromJson(response.body['values']!);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

// get Farms of a farmer
  Future<FarmModel> getFarmsByFarmerOid(String farmerOid) async {
    try {
      final response = await get(
          BaseEndpoint.baseUrl + Endpoints.getFarmsByFarmerOid + farmerOid);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return farmModelFromJson(response.bodyString!);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
