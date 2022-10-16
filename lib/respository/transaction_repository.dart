import 'package:dcms_app/models/agent_farmer.dart';
import 'package:dcms_app/models/new_farm_data.dart';

import '../core/api_service_provider.dart';

class Repository {
  final ApiServiceProvider apiProvider;

  Repository(this.apiProvider);

  // GetFarmers
  Future<FarmerTransaction> getFarmer(var agentOid) =>
      apiProvider.getFarmersByAgentOid(agentOid);

  // GetFarmerFarmData
  Future<NewFarmData> getFarmData(String farmerOid) =>
      apiProvider.getFarmsByFarmerOid(farmerOid);


}
