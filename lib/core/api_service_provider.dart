import 'package:dcms_app/models/account_type.dart';
import 'package:dcms_app/models/agent_farmer.dart';
import 'package:dcms_app/models/cooperative.dart';
import 'package:dcms_app/models/new_farm_data.dart';
import 'package:dcms_app/models/title.dart';
import 'package:dcms_app/routes/auth_endpoints.dart';
import 'package:dcms_app/routes/base.dart';
import 'package:get/get.dart';

import '../models/cluster.dart';
import '../models/marital_status.dart';

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

    //Get title
  Future<Title> getData(String url) async {
    try {
      final response = await get(BaseEndpoint.baseUrl + url );
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return Title.fromJson(response.body) ;
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  //Get cluster data
  Future<Cluster> getClusterData(String url) async {
    try {
      final response = await get(BaseEndpoint.baseUrl + url );
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return Cluster.fromJson(response.body) ;
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

    Future<Cooperative> getCooperativeData(String url) async {
    try {
      final response = await get(BaseEndpoint.baseUrl + url );
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return Cooperative.fromJson(response.body) ;
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<MaritalStatus> getMaritalStatusData(String url) async {
    try {
      final response = await get(BaseEndpoint.baseUrl + url );
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return MaritalStatus.fromJson(response.body) ;
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

   Future<AccountType> getAccountTypeData(String url) async {
    try {
      final response = await get(BaseEndpoint.baseUrl + url );
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return AccountType.fromJson(response.body) ;
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  



  //Get farmers by agent Oid
  Future<FarmerTransaction> getFarmersByAgentOid(String agentOid) async {
    try {
      final response = await get(
          BaseEndpoint.baseUrl + Endpoints.getFarmersByAgentOid + agentOid);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return FarmerTransaction.fromJson(response.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

// get Farms of a farmer
  Future<NewFarmData> getFarmsByFarmerOid(String farmerOid) async {
    print(farmerOid);
    try {
      final response = await get(
          BaseEndpoint.baseUrl + Endpoints.getFarmsByFarmerOid + farmerOid);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return NewFarmData.fromJson(response.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
