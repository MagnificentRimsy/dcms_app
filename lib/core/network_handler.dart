
// ignore_for_file: avoid_print

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class NetworkHandler extends GetxService {


    bool _isLoading = false;
  bool _notification = true;


  bool get isLoading => _isLoading;
  bool get notification => _notification;
  
  static final client = http.Client();
  static  post(String endpoint, var body ) async {
    
    var response = await client.post(baseUrl(endpoint), body:body);
     if (response.statusCode == 201 || response.statusCode == 200) {
      print('Successful $response');
      return response;

    } else {
        print('Failed $response');
        return response;
    }
  }

  static Uri baseUrl (String endpoint) {
    String host = "https://api.dscmportal.com/api/";
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

}