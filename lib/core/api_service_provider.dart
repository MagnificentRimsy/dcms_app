import 'package:dcms_app/models/account_type.dart';
import 'package:dcms_app/models/agent_farmer.dart';
import 'package:dcms_app/models/cooperative.dart';
import 'package:dcms_app/models/country.dart';
import 'package:dcms_app/models/identity_type.dart';
import 'package:dcms_app/models/lga.dart';
import 'package:dcms_app/models/new_farm_data.dart';
import 'package:dcms_app/models/organization.dart';
import 'package:dcms_app/models/relationship_type.dart';
import 'package:dcms_app/models/state_of_origin.dart';
import 'package:dcms_app/models/title.dart';
import 'package:dcms_app/routes/endpoints.dart';
import 'package:dcms_app/routes/base.dart';
import 'package:get/get.dart';

import '../models/bank.dart';
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

    Future<Cooperative> getCooperativeDataByClusterOid(String url, int clusterOid) async {
    try {
      final response = await get(BaseEndpoint.baseUrl+url+clusterOid.toString());
      print('Cooperative by clusterOid $response');
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

  
  Future<Bank> getBankData(String url) async {
    try {
      final response = await get(BaseEndpoint.baseUrl + url );
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return Bank.fromJson(response.body) ;
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Country> getCountryData(String url) async {
    try {
      final response = await get(BaseEndpoint.baseUrl + url );
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return Country.fromJson(response.body) ;
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

 Future<StateOfOrigin> getStateOfOriginData(String url) async {
    try {
      final response = await get(BaseEndpoint.baseUrl + url );
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return StateOfOrigin.fromJson(response.body) ;
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

   Future<IdentityType> getIdentityTypeData(String url) async {
    try {
      final response = await get(BaseEndpoint.baseUrl + url );
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return IdentityType.fromJson(response.body) ;
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Organization> getOrganizationData(String url) async {
    try {
      final response = await get(BaseEndpoint.baseUrl + url );
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return Organization.fromJson(response.body) ;
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }


  



   Future<LocalGovernment> getLocalGovernmentData(String url) async {
    try {
      final response = await get(BaseEndpoint.baseUrl + url );
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return LocalGovernment.fromJson(response.body) ;
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<LocalGovernment> getLocalGovernmentByStateIdData(String url, int stateOid) async {
    try {
      final response = await get(BaseEndpoint.baseUrl +url+stateOid.toString());
      print('local government by stateoid $response');
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return LocalGovernment.fromJson(response.body) ;
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

   Future<RelationshipType> getRelationshipTypeData(String url) async {
    try {
      final response = await get(BaseEndpoint.baseUrl + url );
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        return RelationshipType.fromJson(response.body) ;
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
