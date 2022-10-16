
import 'package:dcms_app/models/account_type.dart';
import 'package:dcms_app/models/cluster.dart';

import '../core/api_service_provider.dart';
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

      


}
