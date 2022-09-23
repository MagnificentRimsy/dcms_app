
import 'package:dcms_app/models/farm.dart';
import 'package:dcms_app/models/farmer.dart';
import '../core/api_service_provider.dart';

class Repository {
  final ApiServiceProvider apiProvider;

  Repository(this.apiProvider);

  // GetFarmers
  Future<FarmerModel> getFarmer(var agentOid) => apiProvider.getFarmersByAgentOid(agentOid);

  // Get Farms
  Future<FarmModel> getFarm(var farmerOid) => apiProvider.getFarmsByFarmerOid(farmerOid);

  
}