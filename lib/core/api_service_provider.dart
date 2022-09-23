import 'dart:convert';

import 'package:dcms_app/routes/auth_endpoints.dart';
import 'package:dcms_app/routes/base.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/farm.dart';
import '../models/farmer.dart';

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
  Future<FarmerModel> getFarmersByAgentOid(String agentOid) async {
    try {
      final response = await get(BaseEndpoint.baseUrl+Endpoints.getFarmersByAgentOid+agentOid);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        print('Dropdown Response ${response.body}');
        
        return farmerModelFromJson(response.body['values']!);

      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

// get Farms of a farmer
  Future<FarmModel> getFarmsByFarmerOid(String farmerOid) async {
    try {
      final response = await get(BaseEndpoint.baseUrl+Endpoints.getFarmsByFarmerOid + farmerOid);
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
