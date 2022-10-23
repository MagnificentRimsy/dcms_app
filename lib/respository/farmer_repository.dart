
import 'package:dcms_app/models/account_type.dart';
import 'package:dcms_app/models/cluster.dart';
import 'package:dcms_app/models/country.dart';
import 'package:dcms_app/models/identity_type.dart';
import 'package:dcms_app/models/lga.dart';
import 'package:dcms_app/models/relationship_type.dart';
import 'package:dcms_app/models/state_of_origin.dart';

import '../core/api_service_provider.dart';
import '../models/bank.dart';
import '../models/cooperative.dart';
import '../models/marital_status.dart';
import '../models/title.dart';

class FarmerRepository {
  final ApiServiceProvider apiProvider;

  FarmerRepository(this.apiProvider);

  Future<Title> getLoadedData(String url) =>
      apiProvider.getData(url);
  
   Future<Cluster> getLoadedClusterData(String url) =>
      apiProvider.getClusterData(url);

  Future<Cooperative> getLoadedCooperativeData(String url) =>
      apiProvider.getCooperativeData(url);

   Future<MaritalStatus> getLoadedMaritalStatusData(String url) =>
      apiProvider.getMaritalStatusData(url);

  Future<AccountType> getLoadedAccountTypeData(String url) =>
      apiProvider.getAccountTypeData(url);

      
  Future<Bank> getLoadedBankData(String url) =>
      apiProvider.getBankData(url);

     
  Future<Country> getLoadedCountryData(String url) =>
      apiProvider.getCountryData(url);

  Future<StateOfOrigin> getLoadedStateOfOriginData(String url) =>
      apiProvider.getStateOfOriginData(url);

   Future<LocalGovernment> getLoadedLocalGovernmentData(String url) =>
      apiProvider.getLocalGovernmentData(url);
  
  Future<RelationshipType> getLoadedRelationshipTypeData(String url) =>
      apiProvider.getRelationshipTypeData(url);
  
  Future<IdentityType> getLoadedIdentityTypeData(String url) =>
      apiProvider.getIdentityTypeData(url);


}
