import 'package:dio/dio.dart';

import '../routes/base.dart';




class ApiServiceProvider  {

  Dio dio = Dio(); 
  Future<Response> sendPost(String url, dynamic data) {
    return dio.post( BaseEndpoint.baseUrl + url, data: data);
  }
}
